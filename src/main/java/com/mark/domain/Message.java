package com.mark.domain;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 22:29
 */
public class Message<T> {

    public final boolean success;
    public final String message;
    private T data;

    public Message(boolean success, String message) {
        this.success = success;
        this.message = message;
    }


    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
