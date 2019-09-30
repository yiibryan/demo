package com.guojiu.common.wechat.model.ftl;

import com.guojiu.common.wechat.model.TemplateValue;

public class Receiving {
    private TemplateValue waybillNo;
    private TemplateValue startAddr;
    private TemplateValue endAddr;
    private TemplateValue arriveTime;
    private TemplateValue container;
    private TemplateValue driverCar;

    public TemplateValue getWaybillNo() {
        return waybillNo;
    }

    public void setWaybillNo(TemplateValue waybillNo) {
        this.waybillNo = waybillNo;
    }

    public TemplateValue getStartAddr() {
        return startAddr;
    }

    public void setStartAddr(TemplateValue startAddr) {
        this.startAddr = startAddr;
    }

    public TemplateValue getEndAddr() {
        return endAddr;
    }

    public void setEndAddr(TemplateValue endAddr) {
        this.endAddr = endAddr;
    }

    public TemplateValue getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(TemplateValue arriveTime) {
        this.arriveTime = arriveTime;
    }

    public TemplateValue getContainer() {
        return container;
    }

    public void setContainer(TemplateValue container) {
        this.container = container;
    }

    public TemplateValue getDriverCar() {
        return driverCar;
    }

    public void setDriverCar(TemplateValue driverCar) {
        this.driverCar = driverCar;
    }
}
