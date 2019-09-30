package com.guojiu.common.rest;

public class PageResponse<T> extends DataResponse<T> {

    private static final long serialVersionUID = 1L;

    protected Integer totalRecords;//分页参数，默认为空
    protected Integer totalPages;//分页参数，默认为空
    protected Integer pageSize;//分页参数，每页条数
    protected Integer pageNum;//分页参数，第几页

    public PageResponse() {
    }

    public PageResponse(Boolean success, String code, String msg) {
        super(success, code, msg);
    }

    public PageResponse(Boolean success, ResultEnum resultEnum) {
        super(success, resultEnum);
    }

    public PageResponse(Boolean success, String code, String msg, T data) {
        super(success, code, msg, data);
    }

    public PageResponse(Boolean success, ResultEnum resultEnum, T data) {
        super(success, resultEnum, data);
    }

    public PageResponse(Boolean success, ResultEnum resultEnum, Integer pageNum, Integer pageSize) {
        super(success, resultEnum);
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public PageResponse(Boolean success, String code, String msg,
                        Integer pageNum, Integer pageSize) {
        super(success, code, msg);
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

}

