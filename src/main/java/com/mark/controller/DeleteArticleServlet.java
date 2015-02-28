package com.mark.controller;

import com.mark.domain.Message;
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
 * Time  : 16:48
 */
@WebServlet(name = "DeleteArticleServlet")
public class DeleteArticleServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uuid = CommonUtil.getURLParam(request.getPathInfo());
        Message message = service.deleteArticle(uuid);
        if (!message.success) {
            request.getSession().setAttribute("message", message.message);
            request.getSession().setAttribute("url", request.getContextPath() + "/manage");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
