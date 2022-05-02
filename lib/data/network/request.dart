import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_screen/data/network/api_constant.dart';

import 'method_type.dart';

class Request {
  Dio _dio = Dio();

  Request({String? baseUrl}) {
    baseUrl ??= ApiConstants.baseUrl;
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveTimeout: 10000,
          connectTimeout: 10000,
          contentType: 'application/json'),
    );
  }

  Future<dynamic> requestApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      var response = await _dio.request(
        url,
        queryParameters: params,
        data: data,
        options: Options(
          method: methods[method],
          headers: header,
        ),
      );
      return response.data;
    } catch (e) {
      return Future.error(e);
    }
  }
}
