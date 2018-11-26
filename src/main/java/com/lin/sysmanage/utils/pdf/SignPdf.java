package com.lin.sysmanage.utils.pdf;

import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfSignatureAppearance;
import com.itextpdf.text.pdf.PdfSignatureAppearance.RenderingMode;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.security.*;
import com.itextpdf.text.pdf.security.MakeSignature.CryptoStandard;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.io.*;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.Certificate;
import java.util.UUID;

public class SignPdf {

    /**
     * @param password    秘钥密码
     * @param inputStream 秘钥文件
     * @param signPdfSrc  签名的PDF文件
     * @param signImage   签名图片文件
     * @param x           x坐标
     * @param y           y坐标
     * @return
     */

    public static byte[] sign(String password, InputStream inputStream, String signPdfSrc, String signImage,
                              float x, float y, int page) {
        File signPdfSrcFile = new File(signPdfSrc);
        PdfReader reader = null;
        ByteArrayOutputStream signPDFData = null;
        PdfStamper stp = null;
        try {
            BouncyCastleProvider provider = new BouncyCastleProvider();
            Security.addProvider(provider);
            KeyStore ks = KeyStore.getInstance("PKCS12", new BouncyCastleProvider());
            // 私钥密码 为Pkcs生成证书是的私钥密码 123456
            ks.load(inputStream, password.toCharArray());
            String alias = (String) ks.aliases().nextElement();
            PrivateKey key = (PrivateKey) ks.getKey(alias, password.toCharArray());
            Certificate[] chain = ks.getCertificateChain(alias);
            reader = new PdfReader(signPdfSrc);
            signPDFData = new ByteArrayOutputStream();
            // 临时pdf文件
            File temp = new File(signPdfSrcFile.getParent(), System.currentTimeMillis() + ".pdf");
            stp = PdfStamper.createSignature(reader, signPDFData, '\0', temp, true);
            stp.setFullCompression();
            PdfSignatureAppearance sap = stp.getSignatureAppearance();
            sap.setReason("数字签名，不可改变");
            // 使用png格式透明图片
            Image image = Image.getInstance(signImage);
            sap.setImageScale(0);
            sap.setSignatureGraphic(image);
            sap.setRenderingMode(RenderingMode.GRAPHIC);
            int size = 120;
            // 是对应x轴和y轴坐标
            float lly = y - 50;
            float lx = x - 160;
            sap.setVisibleSignature(new Rectangle(lx, lly, x + size, lly + size), page,
                    UUID.randomUUID().toString().replaceAll("-", ""));
            stp.getWriter().setCompressionLevel(5);
            //签名算法
            ExternalDigest digest = new BouncyCastleDigest();
            //签名
            ExternalSignature signature = new PrivateKeySignature(key, DigestAlgorithms.SHA512, provider.getName());

            MakeSignature.signDetached(sap, digest, signature, chain, null, null, null, 0, CryptoStandard.CADES);
            stp.close();
            reader.close();
            return signPDFData.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (signPDFData != null) {
                try {
                    signPDFData.close();
                } catch (IOException e) {
                }
            }

            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            }
        }
        return null;
    }
}
