import 'package:dio/dio.dart';
import 'package:auto_complete/api/http_client_interface.dart';


class DioClient implements iHttpClient {
  final dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
