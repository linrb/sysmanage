package com.lin.sysmanage.entity;

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

    private Integer version1;

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

    /**
     * setter for version
     *
     * @param version1
     */
    public void setVersion1(Integer version1) {
        this.version1 = version1;
    }

    /**
     * getter for version1
     */
    public Integer getVersion1() {
        return version1;
    }

}
