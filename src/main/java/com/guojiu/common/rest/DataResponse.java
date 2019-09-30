package com.guojiu.common.rest;

public class DataResponse<T> extends BaseResponse {

    private static final long serialVersionUID = 1L;
    protected T data;// 具体的数据结构，由模块自己定义

    public DataResponse() {
        super();
    }

    public DataResponse(Boolean success, String code, String msg) {
        super(success, code, msg);
    }

    public DataResponse(Boolean success, ResultEnum resultEnum) {
        super(success, resultEnum);
    }

    public DataResponse(Boolean success, String code, String msg, T data) {
        super(success, code, msg);
        this.data = data;
    }

    public DataResponse(Boolean success, ResultEnum resultEnum, T data) {
        super(success, resultEnum);
        this.data = data;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
