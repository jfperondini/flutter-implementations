import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_api/api/http_client_interface.dart';

class HttpPackageClient implements iHttpClient {
  final String baseUrl;

  HttpPackageClient({required this.baseUrl});

  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
