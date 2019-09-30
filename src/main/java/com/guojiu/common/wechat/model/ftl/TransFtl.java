package com.guojiu.common.wechat.model.ftl;

import com.guojiu.common.wechat.model.TemplateValue;

public class TransFtl {
    private TemplateValue waybillNo;
    private TemplateValue startAddr;
    private TemplateValue endAddr;
    private TemplateValue sendTime;
    private TemplateValue container;

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

    public TemplateValue getSendTime() {
        return sendTime;
    }

    public void setSendTime(TemplateValue sendTime) {
        this.sendTime = sendTime;
    }

    public TemplateValue getContainer() {
        return container;
    }

    public void setContainer(TemplateValue container) {
        this.container = container;
    }
}
