package com.common.rest;

import java.io.Serializable;

public class Request<T> implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String toaken=null;
    private  int pageIndex=0;
    private int pageSize=20;
    private T data;

    public String getToaken() {
        return toaken;
    }

    public void setToaken(String toaken) {
        this.toaken = toaken;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
