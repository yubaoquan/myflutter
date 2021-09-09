import 'package:flutter/material.dart';

class NewsOfCategory {
  int _page = 0;
  get page => _page;

  List<dynamic> _news = [];
  get news => _news;

  clear() {
    _page = 0;
    _news = [];
  }

  addNews(List newNews) {
    _news.addAll(newNews);
    _page++;
  }
}

class NewsProvider with ChangeNotifier {
  Map<String, NewsOfCategory> _allNews = {};

  NewsOfCategory getNews(String categoryId) {
    if (!_allNews.containsKey(categoryId)) {
      _allNews[categoryId] = NewsOfCategory();
    }
    return _allNews[categoryId]!;
  }

  void addNews(String categoryId, dynamic news) {
    if (!_allNews.containsKey(categoryId)) {
      _allNews[categoryId] = NewsOfCategory();
    }
    _allNews[categoryId]!.addNews(news);
    notifyListeners();
  }

  void clearNews(String categoryId) {
    _allNews[categoryId]?.clear();
    notifyListeners();
  }
}
