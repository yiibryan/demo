package com.guojiu.common.wechat.message;

public class MusicMessage extends BaseMessage {
    // 音乐
    private com.guojiu.common.wechat.message.Music Music;

    public com.guojiu.common.wechat.message.Music getMusic() {
        return Music;
    }

    public void setMusic(com.guojiu.common.wechat.message.Music music) {
        Music = music;
    }
}
