import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'RouteHandler.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.define('/', handler: indexHandler);
    router.define('/news-detail', handler: newsDetailHandler);
    router.notFoundHandler = notFoundHandler;
  }
}
