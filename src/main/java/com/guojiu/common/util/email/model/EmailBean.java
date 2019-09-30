package com.guojiu.common.util.email.model;

import java.util.List;

public class EmailBean {
    private String content;
    private String subject;
    private String recipientAddress;
    private List<String> fileAddress;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public List<String> getFileAddress() {
        return fileAddress;
    }

    public void setFileAddress(List<String> fileAddress) {
        this.fileAddress = fileAddress;
    }

    public String getRecipientAddress() {
        return recipientAddress;
    }

    public void setRecipientAddress(String recipientAddress) {
        this.recipientAddress = recipientAddress;
    }
}
