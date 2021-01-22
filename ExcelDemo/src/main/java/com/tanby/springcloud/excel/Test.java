package com.tanby.springcloud.excel;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.codec.Base64Decoder;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.URLUtil;

/**
 * @author tanbinyuan
 * @date 2020/4/10
 */
public class Test {

    private static final int COUNT_BITS = Integer.SIZE - 3;
    private static final int CAPACITY   = (1 << COUNT_BITS) - 1;
    private static final int SHUTDOWN   =  0 << COUNT_BITS;
    private static final int TERMINATED =  3 << COUNT_BITS;
    private static final int RUNNING = -1 << COUNT_BITS;

    public static void main(String[] args) {

        for (int i = 0; i<20; i++) {
            System.out.println(UUID.randomUUID().toString(true).toUpperCase());
        }
    }

    private static int runStateOf(int c)     { return c & ~CAPACITY; }
    private static int workerCountOf(int c)  { return c & CAPACITY; }
}
