import 'package:dio/dio.dart';
import 'InitDio.dart';
import 'NewsAPI.dart';

class API {
  late Dio _dio;

  API() {
    _dio = initDio();
  }

  NewsAPI get news => NewsAPI(_dio);
}
