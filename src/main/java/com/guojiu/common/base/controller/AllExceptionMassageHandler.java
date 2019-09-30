package com.guojiu.common.base.controller;

import com.jur.security.authorize.exhandler.ExceptionMassageHandler;
import com.lxxx.common.rest.BaseResponse;

//@Component
public class AllExceptionMassageHandler implements ExceptionMassageHandler {
    @Override
    public Object getExOutMsg(Exception e) {
        return new BaseResponse(false, "500", "未知错误");
    }
}
