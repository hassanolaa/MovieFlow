import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../Models/AppConfig.dart';

class httpServices {
  final Dio _dio = Dio();
  final GetIt _getIt = GetIt.instance;
  String _baseUrl = "";
  String _apiKey = "";

  httpServices() {
    _baseUrl = _getIt.get<AppConfig>().BASE_API_URL;
    _apiKey = _getIt.get<AppConfig>().API_KEY;
  }

  Future<Response?> get(String url,
      {required Map<String, dynamic> query}) async {
    try {
      String _url = '$_baseUrl$url';
      Map<String, dynamic> query = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (query != null) {
        query.addAll(query);
      }
      return await _dio.get(_url, queryParameters: query);
    } on DioError catch (e) {
      print('Unable to perform get request.');
      print('DioError:$e');
    }
  }

  Future<Response?> getSearch(String url,
      {required Map<String, dynamic> query}) async {
    try {
      String _url = '$_baseUrl$url';
      Map<String, dynamic> queryy = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (queryy != null) {
        query.addAll(queryy);
      }
      print(query);
      return await _dio.get(_url, queryParameters: query);
    } on DioError catch (e) {
      print('Unable to perform get request.');
      print('DioError:$e');
    }
  }
}
