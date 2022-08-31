import 'package:dio/dio.dart';
import 'package:my_api/api/http_client_interface.dart';

class DioClient implements iHttpClient {
  late final Dio dio;
  DioClient({required baseUrl}) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
