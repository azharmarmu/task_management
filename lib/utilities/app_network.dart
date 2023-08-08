import 'dart:convert';

import 'package:http/http.dart' as http;

class AppNetwork {
  static const baseUrl =
      'learn-5cdf5-default-rtdb.asia-southeast1.firebasedatabase.app';

  static const taskList = '/taskList.json';
  static const profile = '/profile.json';

  void post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        Uri.https(baseUrl, endpoint),
        body: jsonEncode(body),
        headers: headers,
      );
      print('Post: $response');
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    var response = await http.get(
      Uri.https(baseUrl, endpoint),
      headers: headers,
    );
    var result = jsonDecode(response.body) as Map<String, dynamic>;
    return result;
  }

  //use delete code
}
