abstract class IHttpClient {
  Future<dynamic> get(
    String path,
  );
  Future<dynamic> post(
    String path,
    Map map,
    Map<String, String> headers,
  );
  Future<dynamic> put(String path, data);
  Future<dynamic> delete(
    String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  );
}
