package com.guojiu.common.base.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("base")
public class BaseController {

    private Logger logger = LoggerFactory.getLogger(BaseController.class);

//    @ExceptionHandler(Exception.class)
//    @ResponseStatus(HttpStatus.OK)
//    @ResponseBody
//    public Object handlerException(HttpServletRequest request, Exception ex) {
//        ex.printStackTrace();
//        logger.error(ex.getMessage());
////        if(ex instanceof BusinessException){
////            BusinessException businessException =(BusinessException)ex;
////            responseData.put("errCode",businessException.getErrCode());
////            responseData.put("errMsg",businessException.getErrMsg());
////        }else{
////        }
//        return new BaseResponse(false, "500", "未知错误！");
//
//    }
}


