import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:auto_complete/api/http_client_interface.dart';

class HttpPackageClient implements iHttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
