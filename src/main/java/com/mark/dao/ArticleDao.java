package com.mark.dao;

import com.mark.domain.Article;
import com.mark.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/21
 * Time  : 22:22
 */
public class ArticleDao {

    private DBUtil util = new DBUtil();


    public List<Article> getAllArticleInfo(long userId) {
        String sql = "select uuid, title, date from article where user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Article> articles = new ArrayList<Article>();
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Article article = new Article();
                article.setUuid(rs.getString("uuid"));
                article.setTitle(rs.getString("title"));
                article.setDate(new Date(rs.getInt("date")));
                articles.add(article);
            }
            return articles;
        } catch (SQLException e) {
            e.printStackTrace();
            articles = null;
        } finally {
            util.release(conn, ps, rs);
        }
        return articles;
    }

    public Article getArticle(String uuid) {
        String sql = "select title, text, date from article where uuid = ? limit 1";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Article article = new Article();
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, uuid);
            rs = ps.executeQuery();
            while (rs.next()) {
                article.setUuid(uuid);
                article.setTitle(rs.getString("title"));
                article.setText(rs.getString("text"));
                article.setDate(new Date(rs.getInt("date")));
                return article;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            article = null;
        } finally {
            util.release(conn, ps, rs);
        }
        return article;
    }

}
