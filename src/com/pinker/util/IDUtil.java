package com.pinker.util;

public class IDUtil {
    private static byte[] lock = new byte[0];

    // 位数，默认是8位
    private final static int w = 10000;

    public static String createID() {
        int r = 0;
        synchronized (lock) {
            r = (int) ((Math.random() + 1) * w);
        }

        String id= System.currentTimeMillis()+ String.valueOf(r).substring(1);

        id=id.substring(10);

        return id;
    }

}
