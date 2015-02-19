package com.mark.utils;

import com.sun.org.apache.xerces.internal.impl.dv.util.HexBin;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 20:16
 */
public final class CommonUtil {

    private CommonUtil() {}

    public static String encrypt(String text) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(text.getBytes());
            return HexBin.encode(md5.digest());
        } catch (NoSuchAlgorithmException e) {
            return text;
        }
    }

    public static String UUID() {
        return UUID.randomUUID().toString();
    }

}
