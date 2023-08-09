import 'dart:convert';

import 'package:http/http.dart' as http;

class AppNetwork {
  static const baseUrl =
      'learn-5cdf5-default-rtdb.asia-southeast1.firebasedatabase.app';

  static const taskList = '/taskList';
  static const profile = '/profile';

  Future<Map<String, dynamic>?> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        Uri.https(baseUrl, '$endpoint.json'),
        body: jsonEncode(body),
        headers: headers,
      );
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>?> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.get(
        Uri.https(baseUrl, '$endpoint.json'),
        headers: headers,
      );
      var result = jsonDecode(response.body) as Map<String, dynamic>;
      return result;
    } catch (e) {
      return null;
    }
  }

  //use delete code
  Future<void> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    print('endpoint: $endpoint.json');
    var response = await http.delete(
      Uri.https(baseUrl, '$endpoint.json'),
      headers: headers,
    );
    print(response.body);
  }

  Future<Map<String, dynamic>?> update(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.put(
        Uri.https(baseUrl, '$endpoint.json'),
        body: jsonEncode(body),
        headers: headers,
      );
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
