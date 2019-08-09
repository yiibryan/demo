package com.common.util;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ThreadUtil {
    public static ExecutorService cachedThreadPool = Executors.newCachedThreadPool();
}
