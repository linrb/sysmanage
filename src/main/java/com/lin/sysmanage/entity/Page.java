package com.lin.sysmanage.entity;

public class Page {
    //每页显示数量
    private int pageSize;
    //页码
    private int page;
    //sql语句起始索引
    private int pageNumber;
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getPageNumber() {
        return (pageNumber - 1) * pageSize;
    }
    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }
}
