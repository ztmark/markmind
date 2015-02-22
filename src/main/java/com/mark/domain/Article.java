package com.mark.domain;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Author: Mark
 * Date  : 2015/2/16
 * Time  : 16:35
 */
public class Article {

    private String uuid;
    private String title;
    private String text;
    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private Date date;
    private User user;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return sdf.format(date);
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
