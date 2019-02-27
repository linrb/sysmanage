package com.lin.sysmanage.entity;

import java.util.Date;

public class GoodsOrderEntity extends  BaseEntity {
  
    /**
     * id
     */
    private Integer id;

    /**
     * 商品Id
     */
    private Integer goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 创建时间
     */
    private Date createTime;


    public GoodsOrderEntity() {
        super();
    }

    /**
     * setter for id
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
     * setter for goodsId
     * @param goodsId
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * getter for goodsId
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * setter for goodsName
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
     * setter for createTime
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * getter for createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

}
