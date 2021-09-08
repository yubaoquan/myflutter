import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/index.dart';
import '../pages/news/detail.dart';
import '../pages/404/404.dart';

/// 首页
var indexHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Index();
  },
);

/// 新闻详情
var newsDetailHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NewsDetail();
  },
);

/// 404
var notFoundHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NotFound();
  },
);
