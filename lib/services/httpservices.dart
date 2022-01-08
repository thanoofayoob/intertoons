// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class HttpService {
  int timeout = 15;

  Map<String, String> headerss = {
    'Authorization': '',
    'Content-Type': 'application/json'
  };

  var client = http.Client();
  Future<http.Response?> getApiwithHeader(
      {required String? url, required String? access}) async {
    // bool loadRetry = false;
    Map<String, String> headers = {
      'Authorization': 'Bearer $access',
      'Content-Type': 'application/json'
    };

    // apiLoader(true);
    var response = await client
        .get(Uri.parse(url!), headers: headers)
        .timeout(Duration(seconds: timeout));

    if (response.statusCode < 200 || response.statusCode > 226) {
    } else {
      return response;
    }
  }

  Future<http.Response?> postApiwithHeader(
      {required String? url, required String? access}) async {
    // bool loadRetry = false;
    Map<String, String> headers = {
      'Authorization': 'Bearer $access',
      'Content-Type': 'application/json'
    };

    // apiLoader(true);
    var response = await client
        .post(Uri.parse(url!), headers: headers)
        .timeout(Duration(seconds: timeout));

    if (response.statusCode < 200 || response.statusCode > 226) {
    } else {
      return response;
    }
  }
}
