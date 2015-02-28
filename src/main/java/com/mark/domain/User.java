package com.mark.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/16
 * Time  : 16:34
 */
public class User {

    private int id;
    private String username;
    private String email;
    private String password;
    private String blogName;
    private String motto;
    private List<Article> articles;

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    public String getMotto() {
        return motto;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public List<Article> getArticles() {
        return Collections.unmodifiableList(this.articles);
    }

    public void setArticles(List<Article> articles) {
        if (this.articles == null) {
            this.articles = new ArrayList<>();
        }
        this.articles.addAll(articles);
    }
}
