package com.guojiu.common.base.exception;

import com.jur.security.core.web.exception.ResponseException;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.ResultEnum;

public class BusinessException extends RuntimeException implements ResponseException {
    private String code;
    private String msg;

    public BusinessException(String code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public BusinessException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
        this.code = resultEnum.getCode();
        this.msg = resultEnum.getMsg();
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getReturnObj() {
        return new BaseResponse(false, this.getCode(), this.getMsg());
    }
}
