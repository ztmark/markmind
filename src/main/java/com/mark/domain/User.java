package com.mark.domain;

import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/16
 * Time  : 16:34
 */
public class User {

    private long id;
    private String username;
    private String email;
    private String password;
    private List<Article> articles;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
