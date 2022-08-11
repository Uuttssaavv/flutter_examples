import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(
      LogInterceptor(
        requestBody: kDebugMode ? true : false,
        responseBody: kDebugMode ? true : false,
        requestHeader: kDebugMode ? true : false,
      ),
    );
}
