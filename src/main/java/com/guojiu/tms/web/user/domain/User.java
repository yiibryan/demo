package com.guojiu.tms.web.user.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
import com.lxxx.common.dto.BaseBean;
/**
 *  自动生成model
 */
public class User extends BaseBean{
    //
    private String userId;
    //账号
    private String username;
    //姓名
    private String fullName;
    //密码
    private String password;
    //性别
    private String sex;
    //电话
    private String phone;
    //地址
    private String addr;
    //邮箱
    private String email;
    //启用状态（0：停用,1：启用,2：超级管理员）
    private String state;
    //项目id
    private String projectId;
    //项目名称
    private String projectName;
    //创建时间
    private Date createDate;
    //创建人
    private String createUser;
    //有效期
    private Date validDate;
    //备注
    private String remark;
    //上次登陆时间
    private Date lastLoginTime;
    private List<Integer> ids;

    public void setUserId(String userId){
        this.userId = userId;
    }
    public String getUserId(){
        return this.userId;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getUsername(){
        return this.username;
    }
    public void setFullName(String fullName){
        this.fullName = fullName;
    }
    public String getFullName(){
        return this.fullName;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public String getPassword(){
        return this.password;
    }
    public void setSex(String sex){
        this.sex = sex;
    }
    public String getSex(){
        return this.sex;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }
    public String getPhone(){
        return this.phone;
    }
    public void setAddr(String addr){
        this.addr = addr;
    }
    public String getAddr(){
        return this.addr;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getEmail(){
        return this.email;
    }
    public void setState(String state){
        this.state = state;
    }
    public String getState(){
        return this.state;
    }
    public void setProjectId(String projectId){
        this.projectId = projectId;
    }
    public String getProjectId(){
        return this.projectId;
    }
    public void setProjectName(String projectName){
        this.projectName = projectName;
    }
    public String getProjectName(){
        return this.projectName;
    }
    public void setCreateDate(Date createDate){
        this.createDate = createDate;
    }
    public Date getCreateDate(){
        return this.createDate;
    }
    public void setCreateUser(String createUser){
        this.createUser = createUser;
    }
    public String getCreateUser(){
        return this.createUser;
    }
    public void setValidDate(Date validDate){
        this.validDate = validDate;
    }
    public Date getValidDate(){
        return this.validDate;
    }
    public void setRemark(String remark){
        this.remark = remark;
    }
    public String getRemark(){
        return this.remark;
    }
    public void setLastLoginTime(Date lastLoginTime){
        this.lastLoginTime = lastLoginTime;
    }
    public Date getLastLoginTime(){
        return this.lastLoginTime;
    }
    public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}
