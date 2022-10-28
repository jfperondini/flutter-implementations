import 'package:dio/dio.dart';
import 'package:project/api/client_interface.dart';

class DioClient implements IHttpClient {
  final List<InterceptorsWrapper>? interceptor;

  late final Dio dio;
  DioClient({
    required baseUrl,
    this.interceptor,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    if (interceptor != null) dio.interceptors.addAll(interceptor!);
  }

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
