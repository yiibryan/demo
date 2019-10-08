package com.guojiu.tms.web.user.domain;

import java.io.Serializable;

/**
 *  自动生成model
 */
public class UserNew implements Serializable {
    //
    private String userId;
    //账号
    private String username;

    public UserNew(User user) {
        this.userId = user.getUserId();
        this.username = user.getUsername();
        this.fullName = user.getFullName();
    }

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
