// lib/api_service.dart

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> fetchPosts() async {
    try {
      // final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final response = await _dio.get(
          'http://192.168.18.123:4000/jokes'); // ipconfig ko cmd me likho aur    IPv4 Address. ko url me daalo.

      return response.data;
    } on DioError catch (e) {
      throw Exception('Failed to load posts: ${e.message}');
    }
  }
}
