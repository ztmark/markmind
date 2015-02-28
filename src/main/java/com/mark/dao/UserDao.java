package com.mark.dao;

import com.mark.domain.User;
import com.mark.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 20:07
 */
public class UserDao {

    private DBUtil util = new DBUtil();

    public boolean updatePwd(int userId, String newPwd) {
        String sql = "UPDATE user SET password = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPwd);
            ps.setInt(2, userId);
            int row = ps.executeUpdate();
            return row > 0 ;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.release(conn, ps, null);
        }
        return false;
    }

    public boolean updateBlogInfo(int userId, String blogName, String motto) {
        String sql = "UPDATE user SET blog_name = ? , motto = ? WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, blogName);
            ps.setString(2, motto);
            ps.setInt(3, userId);
            int row = ps.executeUpdate();
            return row > 0 ;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.release(conn, ps, null);
        }
        return false;
    }

    public User getBlogInfo(String username) {
        String sql = "select blog_name, motto from user where username = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            User blogInfo = new User();
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                blogInfo.setBlogName(rs.getString("blog_name"));
                blogInfo.setMotto(rs.getString("motto"));
                blogInfo.setUsername(username);
            }
            return blogInfo;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.release(conn, ps, rs);
        }
        return null;
    }


    public boolean exists(String username) {
        String sql = "select id from user where username = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = util.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.release(conn, ps, rs);
        }
        return false;
    }

}
