package com.example.tracker;

import android.os.Handler;
import android.os.Looper;

import java.security.MessageDigest;
import java.util.function.Function;

public class Utils {
    public static String sha256(final String base) {
        try{
            final MessageDigest digest = MessageDigest.getInstance("SHA-256");
            final byte[] hash = digest.digest(base.getBytes("UTF-8"));
            final StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                final String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }

    public static void runThread(iCallback fun){
        try {
            Thread t = new Thread(new Runnable() {
                @Override
                public void run() {
                    fun.callback();
                }
            });
            t.start();
            t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void runUiThread(iCallback fun){
        new Handler(Looper.getMainLooper()).post(new Runnable () {
            @Override
            public void run () {
                fun.callback();
            }
        });
    }

    public interface iCallback{
        void callback();
    }
}
