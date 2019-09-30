package com.guojiu.common.wechat.message;

public class VideoMessage extends BaseMessage {
    // 视频
    private com.guojiu.common.wechat.message.Video Video;

    public com.guojiu.common.wechat.message.Video getVideo() {
        return Video;
    }

    public void setVideo(com.guojiu.common.wechat.message.Video video) {
        Video = video;
    }
}
