package com.guojiu.tms.web.user.domain;

import com.lxxx.common.dto.BaseBean;

import java.util.Date;
import java.util.List;

/**
 *  自动生成model
 */
public class UserNew extends BaseBean{
    //
    private String userId;
    //账号
    private String username;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    //姓名
    private String fullName;

}
