package com.mark.service;

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

}
