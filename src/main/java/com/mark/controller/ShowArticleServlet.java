package com.mark.controller;

import com.mark.domain.Article;
import com.mark.domain.Message;
import com.mark.service.ArticleService;
import com.mark.utils.CommonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;

/**
 * Author: Mark
 * Date  : 2015/2/22
 * Time  : 20:04
 */

public class ShowArticleServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuid = CommonUtil.getURLParam(request.getPathInfo());
        Message<Article> message = service.getArticle(uuid);
        if (message.success) {
            Article article = message.getData();
            request.getSession().setAttribute("article", article);
        } else {
            request.getSession().setAttribute("msg", message.message);
            request.getSession().setAttribute("url", "/markmind/home");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }

        request.getRequestDispatcher("/WEB-INF/frontend/article.jsp").forward(request, response);
    }
}
