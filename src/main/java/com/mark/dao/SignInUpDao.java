package com.mark.dao;

import com.mark.domain.Message;
import com.mark.domain.User;
import com.mark.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 20:57
 */
public class SignInUpDao {
    
    private DBUtil util = new DBUtil();

    public User signIn(String username, String password) {
        Connection connection = util.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select id, email, blog_name, motto from user where username = ? and password = ? limit 1";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setBlogName(rs.getString("blog_name"));
                user.setMotto(rs.getString("motto"));
                user.setUsername(username);
                user.setPassword(password);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.release(connection, ps, rs);
        }
        return null;
    }

    public Boolean signUp(User user) {
        Connection connection = util.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "insert into user(username,email, password) values(?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            util.release(connection, ps, rs);
        }
    }

    public Message checkUser(User user) {
        Connection connection = util.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT username,email FROM user WHERE username = ? OR email = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername().trim().toLowerCase());
            ps.setString(2, user.getEmail().trim());
            rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                if (username.equalsIgnoreCase(user.getUsername())) {
                    return new Message(false, "用户名已存在");
                } else {
                    return new Message(false, "该邮箱已被使用");
                }
            }
            return new Message(true,"");
        } catch (SQLException e) {
            e.printStackTrace();
            return new Message(false, "服务器忙，请重试");
        } finally {
            util.release(connection, ps, rs);
        }
    }
}
