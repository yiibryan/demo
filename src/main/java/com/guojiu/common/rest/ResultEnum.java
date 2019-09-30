package com.guojiu.common.rest;

public enum ResultEnum {
    SUCCESS("200", "操作成功"),
    INSERT_SUCCESS("201", "添加成功"),
    UPDATE_SUCCESS("202", "修改成功"),
    DELETE_SUCCESS("203", "删除成功"),
    SELECT_SUCCESS("204", "查询成功"),
    UPLOAD_SUCCESS("205", "上传成功"),
    LOGIN_SUCCESS("206", "登录成功"),
    SEND_CODE_SUCCESS("207", "发送验证码成功"),

    FAIL("300", "操作失败"),
    INSERT_FAIL("301", "添加失败"),
    UPDATE_FAIL("302", "修改失败"),
    DELETE_FAIL("303", "删除失败"),
    SELECT_FAIL("304", "查询失败"),
    UPLOAD_FAIL("305", "上传失败"),
    LOGIN_FAIL("306", "登录失败"),
    SEND_CODE_FAIL("307", "发送验证码失败"),

    E400("400", "参数异常"),
    E403("403", "用户不存在或登录过期"),

    ERROR("500", "服务器错误"),

    /*------------------文件上传start--------------------*/
    E501("501", "需要配置上传文件路径（jur.security.fileUploadUrl）"),
    E502("502", "错误的文件名");
    /*------------------文件上传end--------------------*/

    private String code;

    private String msg;

    private ResultEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
