package com.guojiu.common.wechat.message;

public class ImageMessage extends BaseMessage {

    private com.guojiu.common.wechat.message.Image Image;

    public com.guojiu.common.wechat.message.Image getImage() {
        return Image;
    }

    public void setImage(com.guojiu.common.wechat.message.Image image) {
        Image = image;
    }
}
