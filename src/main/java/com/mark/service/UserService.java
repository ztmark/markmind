package com.mark.service;

import com.mark.dao.UserDao;
import com.mark.domain.Message;
import com.mark.dao.SignInUpDao;
import com.mark.domain.User;
import com.mark.utils.CommonUtil;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 20:15
 */
public class UserService {

    private SignInUpDao dao = new SignInUpDao();
    private UserDao userDao = new UserDao();


    public User loginChecker(String username, String password) {
        return dao.signIn(username, CommonUtil.encrypt(password));
    }

    public Message addUser(String username, String email, String password) {
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(CommonUtil.encrypt(password));
        Message msg = dao.checkUser(user);
        if (msg.success) {
            dao.signUp(user);
            return new Message(true, "注册成功");
        } else {
            return msg;
        }
    }

    public Message<User> updatePwd(User user, String newPwd) {
        Message<User> message;
        if (user.getPassword().equals(CommonUtil.encrypt(newPwd))) {
            message = new Message<>(true, "密码修改成功！");
            message.setData(user);
            return message;
        }
        boolean result = userDao.updatePwd(user.getId(), CommonUtil.encrypt(newPwd));
        if (result) {
            message = new Message<>(true, "密码修改成功！");
            user.setPassword(CommonUtil.encrypt(newPwd));
        } else {
            message = new Message<>(false, "服务器忙，请稍后重试！");
        }
        message.setData(user);
        return message;
    }

    public Message<User> updateBlogInfo(User user, String blogName, String motto) {
        Message<User> message;
        if (blogName == null || "".equals(blogName.trim())) {
            blogName = "MarkMind";
        }
        if (motto == null || "".equals(motto.trim())) {
            motto = "Start Blogging";
        }
        if (user.getBlogName().equals(blogName) && user.getMotto().equals(motto)) {
            message = new Message<>(true, "修改成功！");
            message.setData(user);
            return message;
        }
        boolean result = userDao.updateBlogInfo(user.getId(), blogName, motto);
        if (result) {
            message = new Message<>(true, "修改成功！");
            user.setBlogName(blogName);
            user.setMotto(motto);
            message.setData(user);
        } else {
            message = new Message<>(false, "服务器忙，请稍后重试！");
        }
        return message;
    }

}
