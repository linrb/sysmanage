package com.lin.sysmanage.entity;

import java.math.BigDecimal;

public class GoodsEntity extends BaseEntity {
    /**
     * ID
     */
    private Integer id;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 库存
     */
    private Integer count;

    /**
     * 已售
     */
    private Integer sale;

    /**
     * 乐观锁，版本号
     */
    private Integer version;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品单价
     */
    private BigDecimal goodsPrice;

    /**
     * 商品介绍
     */
    private String goodsDetail;

    public GoodsEntity() {
        super();
    }

    /**
     * setter for id
     *
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * getter for id
     */
    public Integer getId() {
        return id;
    }

    /**
     * setter for goodsName
     *
     * @param goodsName
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * getter for goodsName
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * setter for count
     *
     * @param count
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * getter for count
     */
    public Integer getCount() {
        return count;
    }

    /**
     * setter for sale
     *
     * @param sale
     */
    public void setSale(Integer sale) {
        this.sale = sale;
    }

    /**
     * getter for sale
     */
    public Integer getSale() {
        return sale;
    }

    /**
     * setter for version
     *
     * @param version
     */
    public void setVersion(Integer version) {
        this.version = version;
    }

    /**
     * getter for version
     */
    public Integer getVersion() {
        return version;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsDetail() {
        return goodsDetail;
    }

    public void setGoodsDetail(String goodsDetail) {
        this.goodsDetail = goodsDetail;
    }

}
