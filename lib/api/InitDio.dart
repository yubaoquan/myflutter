import 'package:dio/dio.dart';

Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'https://v.juhe.cn',
    connectTimeout: 5000,
  );

  Dio dio = Dio(_baseOptions);

  return dio;
}
