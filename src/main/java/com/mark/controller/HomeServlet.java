package com.mark.controller;

import com.mark.domain.Article;
import com.mark.domain.Message;
import com.mark.domain.User;
import com.mark.service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/21
 * Time  : 22:21
 */
@WebServlet(name = "HomeServlet")
public class HomeServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Message<List<Article>> message = service.getAllArticle(user.getId());
        if (message.success) {
            request.getSession().setAttribute("articles", message.getData());
            request.getRequestDispatcher("/WEB-INF/frontend/index.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("message", message.message);
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }

    }
}
