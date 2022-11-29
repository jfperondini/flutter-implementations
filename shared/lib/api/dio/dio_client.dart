import 'package:dio/dio.dart';
import 'package:shared/api/client_interface.dart';

class DioClient implements IHttpClient {
  late final Dio dio;

  @override
  Future get(String path) async {
    final response = await dio.get(path);
    return response;
  }

  @override
  Future post(String path, Map map, Map<String, String> headers) async {
    final response =
        await dio.post(path, data: map, options: Options(headers: headers));
    return response;
  }
}
