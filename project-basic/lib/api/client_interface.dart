abstract class IHttpClient {
  Future<dynamic> get(String path);
  Future<dynamic> post(String path, Map map, Map<String, String> headers);
}
