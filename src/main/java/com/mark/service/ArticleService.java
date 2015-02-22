package com.mark.service;

import com.mark.dao.ArticleDao;
import com.mark.domain.Article;
import com.mark.domain.Message;

import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/21
 * Time  : 22:36
 */
public class ArticleService {

    private ArticleDao dao = new ArticleDao();

    public Message<List<Article>> getAllArticle(long userId) {
        Message<List<Article>> message = null;
        List<Article> articles = dao.getAllArticleInfo(userId);
        if (articles == null) {
            message = new Message<List<Article>>(false, "服务器忙，请稍后重试！");
        } else {
            message = new Message<List<Article>>(true, "success");
            message.setData(articles);
        }
        return message;
    }

}
