import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:product_catalog/constants.dart';

class GetData {
  final Uri url;
  final Map<String, String>? headers;

  GetData({required this.url, this.headers});

  Future getData() async {
    http.Response response = await http.get(url, headers: headers);

    if (kDebugMode) {
      log('GET: $url');
      log(response.body);
    }

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }
}
