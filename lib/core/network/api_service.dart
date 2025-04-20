import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(String url, {required Map<String, dynamic> data}) async {
    return dio.post(url, data: data);
  }
}

