package com.mark.service;

import com.mark.dao.ArticleDao;
import com.mark.domain.Article;
import com.mark.domain.Message;
import com.mark.utils.CommonUtil;

import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/21
 * Time  : 22:36
 */
public class ArticleService {

    private ArticleDao dao = new ArticleDao();

    public Message<List<Article>> getAllArticle(int userId) {
        Message<List<Article>> message = null;
        List<Article> articles = dao.getAllArticleInfo(userId);
        if (articles == null) {
            message = new Message<>(false, "服务器忙，请稍后重试！");
        } else {
            message = new Message<>(true, "success");
            message.setData(articles);
        }
        return message;
    }

    public Message<Article> getArticle(String uuid) {
        Message<Article> message = null;
        Article article = dao.getArticle(uuid);
        if (article == null) {
            message = new Message<>(false, "服务器忙，请稍后重试！");
        } else {
            message = new Message<>(true, "success");
            message.setData(article);
        }
        return message;
    }

    public Message addArticle(String title, String text, int userId) {
        Article article = new Article();
        article.setUuid(CommonUtil.UUID());
        article.setTitle(title);
        article.setText(text);
        Message message;
        if (dao.addArticle(article, userId)) {
            message = new Message(true, "添加成功！");
        } else {
            message = new Message(false, "服务器忙，请稍后重试！");
        }
        return message;
    }

    public Message updateArticle(String uuid, String title, String text) {
        Article article = new Article();
        article.setUuid(uuid);
        article.setTitle(title);
        article.setText(text);
        Message message;
        if (dao.updateArticle(article)) {
            message = new Message(true, "更新成功！");
        } else {
            message = new Message(false, "服务器忙，请稍后重试！");
        }
        return message;
    }

    public Message deleteArticle(String uuid) {
        Message message;
        if (dao.deleteArticle(uuid)) {
            message = new Message(true, "删除成功！");
        } else {
            message = new Message(false, "服务器忙，请稍后重试！");
        }
        return message;
    }
}
