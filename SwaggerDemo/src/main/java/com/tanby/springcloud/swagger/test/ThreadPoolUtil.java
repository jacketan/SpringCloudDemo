package com.tanby.springcloud.swagger.test;

import java.util.concurrent.*;

public class ThreadPoolUtil {

    private static final ThreadPoolExecutor executor;

    static {
        int processors = Runtime.getRuntime().availableProcessors();
        executor = new ThreadPoolExecutor(processors, processors * 2, 10, TimeUnit.MINUTES, new LinkedBlockingDeque<>(100));
    }

    public static Future sumit(Runnable runnable) {
        return executor.submit(runnable);
    }

    public static Future sumit(Callable callable) {
        return executor.submit(callable);
    }

    public static void run(Runnable runnable) {
        executor.execute(runnable);
    }

    public static void shutdown() {
        executor.shutdown();
    }
}
