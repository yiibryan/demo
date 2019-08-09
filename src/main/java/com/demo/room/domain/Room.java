package com.demo.room.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
/**
 *  自动生成model
 */
public class Room{
    //id
    private Integer id;
    //所属单元
    private Integer unitId;
    //房间号
    private String roomNo;
    //户型
    private Integer apartmentId;
    //价格
    private BigDecimal price;
    //最低价格
    private BigDecimal lowPrice;
    //第几层
    private Integer layer;
    //
    private String publicArea;
    //是否跃层
    private Integer springLayer;
    //朝向
    private Integer orientation;
    //状态
    private Integer status;
    //创建时间
    private Date createTime;
    //总价
    private BigDecimal totalPrice;
    //
    private Date saleTime;
    private List<Integer> ids;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setUnitId(Integer unitId){
        this.unitId = unitId;
    }
    public Integer getUnitId(){
        return this.unitId;
    }
    public void setRoomNo(String roomNo){
        this.roomNo = roomNo;
    }
    public String getRoomNo(){
        return this.roomNo;
    }
    public void setApartmentId(Integer apartmentId){
        this.apartmentId = apartmentId;
    }
    public Integer getApartmentId(){
        return this.apartmentId;
    }
    public void setPrice(BigDecimal price){
        this.price = price;
    }
    public BigDecimal getPrice(){
        return this.price;
    }
    public void setLowPrice(BigDecimal lowPrice){
        this.lowPrice = lowPrice;
    }
    public BigDecimal getLowPrice(){
        return this.lowPrice;
    }
    public void setLayer(Integer layer){
        this.layer = layer;
    }
    public Integer getLayer(){
        return this.layer;
    }
    public void setPublicArea(String publicArea){
        this.publicArea = publicArea;
    }
    public String getPublicArea(){
        return this.publicArea;
    }
    public void setSpringLayer(Integer springLayer){
        this.springLayer = springLayer;
    }
    public Integer getSpringLayer(){
        return this.springLayer;
    }
    public void setOrientation(Integer orientation){
        this.orientation = orientation;
    }
    public Integer getOrientation(){
        return this.orientation;
    }
    public void setStatus(Integer status){
        this.status = status;
    }
    public Integer getStatus(){
        return this.status;
    }
    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }
    public Date getCreateTime(){
        return this.createTime;
    }
    public void setTotalPrice(BigDecimal totalPrice){
        this.totalPrice = totalPrice;
    }
    public BigDecimal getTotalPrice(){
        return this.totalPrice;
    }
    public void setSaleTime(Date saleTime){
        this.saleTime = saleTime;
    }
    public Date getSaleTime(){
        return this.saleTime;
    }
    public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}
