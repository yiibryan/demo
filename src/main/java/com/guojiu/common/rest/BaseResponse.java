package com.guojiu.common.rest;

import java.io.Serializable;

public class BaseResponse implements Serializable {

    private static final long serialVersionUID = 1L;

    protected Boolean success;
    protected String code;// 状态码，参与上面统一规划
    protected String msg;// 返回的提示消息，当前全部用中文

    public BaseResponse() {
    }

    public BaseResponse(Boolean success, String code, String msg) {
        this.success = success;
        this.code = code;
        this.msg = msg;
    }

    public BaseResponse(Boolean success, ResultEnum resultEnum) {
        this.success = success;
        this.code = resultEnum.getCode();
        this.msg = resultEnum.getMsg();
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
