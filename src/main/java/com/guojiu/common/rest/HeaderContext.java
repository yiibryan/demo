package com.guojiu.common.rest;

public class HeaderContext {
    private static ThreadLocal<String> Authorization = new ThreadLocal<String>();

    public static String getAuthorization() {
        return Authorization.get();
    }

    public static void setAuthorization(String authorization) {
        Authorization.set(authorization);
    }

    public static void removeAuthorization(){
        Authorization.remove();
    }
}
