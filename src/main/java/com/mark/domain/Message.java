package com.mark.dao;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 22:29
 */
public class Message {

    public final boolean success;
    public final String message;

    public Message(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}
