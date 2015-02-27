package com.mark.controller;

import com.mark.domain.Article;
import com.mark.domain.Message;
import com.mark.domain.User;
import com.mark.service.ArticleService;
import com.mark.utils.CommonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Author: Mark
 * Date  : 2015/2/27
 * Time  : 15:51
 */
@WebServlet(name = "UpdateArticleServlet")
public class UpdateArticleServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuid = CommonUtil.getURLParam(request.getPathInfo());
        String title = request.getParameter("title");
        String text = request.getParameter("text");
        Message message = service.updateArticle(uuid, title, text);
        if (message.success) {
            request.getSession().setAttribute("msg", "更新成功，3秒后跳转...");
            request.getSession().setAttribute("url", request.getContextPath() + "/manage");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("msg", message.message);
            request.getSession().setAttribute("url", request.getContextPath() + "/manage");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuid = CommonUtil.getURLParam(request.getPathInfo());
        Message<Article> message = service.getArticle(uuid);
        if (message.success) {
            request.getSession().setAttribute("article", message.getData());
            request.getRequestDispatcher("/WEB-INF/backend/update.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("msg", message.message);
            request.getSession().setAttribute("url", request.getContextPath() + "/manage");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }
    }
}
