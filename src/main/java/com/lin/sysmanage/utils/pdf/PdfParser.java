package com.lin.sysmanage.utils.pdf;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.geom.Vector;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.parser.EventType;
import com.itextpdf.kernel.pdf.canvas.parser.PdfDocumentContentParser;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
import com.itextpdf.kernel.pdf.canvas.parser.data.TextRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.listener.IEventListener;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.lin.sysmanage.utils.FileUtil;
import com.lin.sysmanage.utils.Log4jUtils;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class PdfParser {
    private static Logger log = Log4jUtils.getLog(PdfParser.class);

    public enum SignType {
        //甲签
        SIGN_A(1),
        //乙签
        SIGN_B(2);
        private Integer type;

        SignType(Integer type) {
            this.type = type;
        }

        public Integer getType() {
            return type;
        }
    }

    /**
     * 甲乙方签名方法
     *
     * @param rootPath 初始合同pdf路径
     * @param tempPath 基于哪份合同签章，比如甲方先签，这里填的就是初始合同地址；若是乙方签，这里填的就是甲方签过生成的合同地址
     * @param outPath  输出的合同地址，包含文件名
     * @param imgPath  签章图片地址
     * @param signType 甲方签章还是乙方签章，输入枚举类型
     * @param contents 签章处文本内容
     * @param already  理论上甲签的时候是false，表示没有签过，乙签的时候是true，表示甲已经签过，就算下面高度不够也不会新增页面
     *                 若需求改动，可以乙先签，那逻辑控制，先签的false，后签的true；
     *                 该项错误可能导致第二方签章时新启一页签章
     */
    public void startSign(String rootPath, String tempPath, String outPath, String imgPath, SignType signType, List<String> contents, boolean already) {
        String tempRootPath = "";
        try {
            //读取文章尾部位置
            MyRectangle myRectangle = getLastWordRectangle(rootPath);
            //还没签印的，临时文件路径
            System.out.println(tempPath);
            tempRootPath = rootPath.substring(0, rootPath.length() - 4) + "_temp.pdf";

            //添加尾部内容
            SignPosition signPosition = addTailSign(myRectangle, tempPath, tempRootPath, signType.getType(), contents, already);
            InputStream in = PdfParser.class.getClassLoader().getResourceAsStream("lin.p12");

            byte[] fileData = SignPdf.sign("123456", in, tempRootPath, imgPath, signPosition.getX(), signPosition.getY(), signPosition.getPageNum());
            FileUtil.uploadFile(fileData, outPath);
        } catch (Exception e) {
            log.error("签名出错", e);
        } finally {
            File file = new File(tempRootPath);
            if (file.exists()) {
                boolean flag = file.delete();
                if (flag) {
                    log.debug("临时文件删除成功");
                }
            }
        }
    }

    /**
     * 添加尾部签名部分(不含签名或印章)
     *
     * @param myRectangle 文档末尾位置和大致信息
     * @param input       输入文档路径
     * @param output      输出文档路径
     * @param type        1-甲签 2-乙签
     * @param content     填写内容
     * @param already     理论上甲签的时候是false，表示没有签过，乙签的时候是true，表示甲已经签过，就算下面高度不够也不会新增页面
     *                    若需求改动，可以乙先签，那逻辑控制，先签的false，后签的true
     * @throws Exception
     */
    private SignPosition addTailSign(MyRectangle myRectangle, String input, String output, Integer type, List<String> content, boolean already) throws Exception {

        PdfReader reader = new PdfReader(input);
        PdfWriter writer = new PdfWriter(output);
        PdfDocument pdf = new PdfDocument(reader, writer);
        int numberOfPages = pdf.getNumberOfPages();

        Document doc = new Document(pdf);
        //处理中文问题
        //方式一：使用Windows系统字体(TrueType)
        // PdfFont font = PdfFontFactory.createFont("C:/Windows/Fonts/simsun.ttc,1", PdfEncodings.IDENTITY_H,true);
        //方式二：使用资源字体(ClassPath)
        //PdfFont font =  PdfFontFactory.createFont("/SIMYOU.TTF", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
        //方式三：使用iTextAsian.jar中的字体
        PdfFont font = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);
        //判断签名高度是否够
        int size = content.size();
        float maxRecHeight = myRectangle.getMinlineHeight() * size;
        float v = myRectangle.getBottom() - maxRecHeight;
        boolean isNewPage = false;
        if (v <= myRectangle.getMinlineHeight() * 3) {
            isNewPage = true;
            if (!already) {
                pdf.addNewPage();
                numberOfPages++;
            }
            myRectangle.setBottom(myRectangle.getTop() * 2 - maxRecHeight * 2);
        }
        Table table = new Table(1);
        table.setPageNumber(numberOfPages);
        float bottom = (myRectangle.getBottom() - maxRecHeight) / 2;
        float left1;
        left1 = myRectangle.getLeft() + 30f;
        if (type == 2) {
            left1 = left1 + myRectangle.getWidth() / 2 - 15;
        }
        myRectangle.setLeft(left1);
        table.setFixedPosition(left1, bottom, 200);
        table.setBorder(Border.NO_BORDER);


        for (String text : content) {
            Paragraph paragraph = new Paragraph();
            paragraph.add(text).setFont(font).setFontSize(myRectangle.getHeight());
            Cell cell = new Cell();
            cell.add(paragraph);
            cell.setBorder(Border.NO_BORDER);
            table.addCell(cell);
        }

        doc.add(table);
        doc.flush();
        pdf.close();
        return getSignPosition(myRectangle, content, bottom, numberOfPages, isNewPage);
    }

    private SignPosition getSignPosition(MyRectangle myRectangle, List<String> content, float bottom, int numberOfPages, boolean isNewPage) {
        SignPosition signPosition = new SignPosition();
        //y轴位置，底部
        if (isNewPage) {
            signPosition.setY(bottom + (content.size() - 2) * myRectangle.getMinlineHeight());
        } else {
            signPosition.setY(bottom + (content.size() - 3) * myRectangle.getMinlineHeight());
        }
        //x轴位置，文字宽度+偏移量
        signPosition.setX(myRectangle.getLeft() + content.get(0).length() * myRectangle.getHeight() - 15f);
        signPosition.setPageNum(numberOfPages);
        return signPosition;
    }

    /**
     * 拿到文章末尾参数
     */
    private MyRectangle getLastWordRectangle(String input) throws IOException {
        PdfDocument pdfDocument = new PdfDocument(new PdfReader(input));
        MyEventListener myEventListener = new MyEventListener();
        PdfDocumentContentParser parser = new PdfDocumentContentParser(pdfDocument);
        parser.processContent(pdfDocument.getNumberOfPages(), myEventListener);
        List<Rectangle> rectangles = myEventListener.getRectangles();
        float left = 100000;
        float right = 0;
        float bottom = 100000;
        boolean isTop = true;
        Rectangle tempRec = null;
        float minV = 1000;
        MyRectangle myRectangle = new MyRectangle();
        //拿到文本最左最下和最右位置
        for (Rectangle rectangle : rectangles) {
            if (isTop) {
                myRectangle.setTop(rectangle.getY());
                isTop = false;
            }
            if (tempRec != null) {
                float v = tempRec.getY() - rectangle.getY();
                if (v < minV && v > 5f) {
                    minV = v;
                }
            }
            tempRec = rectangle;
            float lt = rectangle.getLeft();
            float rt = rectangle.getRight();
            float y = rectangle.getBottom();
            if (lt < left) {
                left = lt;
            }
            if (rt > right) {
                right = rt;
            }
            if (y < bottom) {
                bottom = y;
            }

        }
        Rectangle rectangle = rectangles.get(rectangles.size() - 1);
        float height = rectangle.getHeight();
        myRectangle.setHeight(height);
        myRectangle.setLeft(left);
        myRectangle.setRight(right);
        myRectangle.setBottom(bottom);
        myRectangle.setMinlineHeight(minV);
        myRectangle.setLineSpace(minV - height);
        myRectangle.setWidth(right - left);
        pdfDocument.close();
        return myRectangle;
    }


    static class MyEventListener implements IEventListener {
        private List<Rectangle> rectangles = new ArrayList<>();

        @Override
        public void eventOccurred(IEventData data, EventType type) {
            if (type == EventType.RENDER_TEXT) {
                TextRenderInfo renderInfo = (TextRenderInfo) data;
                if ("".equals(renderInfo.getText().trim())) {
                    return;
                }
                Vector startPoint = renderInfo.getDescentLine().getStartPoint();
                Vector endPoint = renderInfo.getAscentLine().getEndPoint();
                float x1 = Math.min(startPoint.get(0), endPoint.get(0));
                float x2 = Math.max(startPoint.get(0), endPoint.get(0));
                float y1 = Math.min(startPoint.get(1), endPoint.get(1));
                float y2 = Math.max(startPoint.get(1), endPoint.get(1));
                rectangles.add(new Rectangle(x1, y1, x2 - x1, y2 - y1));
            }
        }

        @Override
        public Set<EventType> getSupportedEvents() {
            return new LinkedHashSet<>(Collections.singletonList(EventType.RENDER_TEXT));
        }

        public List<Rectangle> getRectangles() {
            return rectangles;
        }

        public void clear() {
            rectangles.clear();
        }
    }
}
