import 'package:dio/dio.dart';

class NewsAPI {
  static const String apiKey = 'dfb93ade00c180409254236a492998bc';

  final Dio _dio;

  NewsAPI(this._dio);

  Future<dynamic> newsList({
    required String type,
    int page = 1,
    int pageSize = 10,
  }) async {
    Response res = await _dio.get(
      '/toutiao/index',
      queryParameters: {
        'key': NewsAPI.apiKey,
        'page': page,
        'page_size': pageSize,
        'type': type,
      },
    );

    return res.data;
  }
}
