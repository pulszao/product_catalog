import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:product_catalog/constants.dart';

class PostData {
  final Uri url;
  final Map<String, String>? headers;
  final Object? body;

  PostData({required this.url, this.headers, this.body});

  Future postData() async {
    http.Response response = await http.post(url, headers: headers, body: body);

    if (kDebugMode) {
      log('POST: ${response.statusCode} $url');
      log('POST BODY: ${response.body}');
    }

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }
}
