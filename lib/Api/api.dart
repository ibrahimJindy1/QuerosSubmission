import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:queros_submission/models/user.dart';

class APIServices {
  String urlOrigin = 'localhost:44340';
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Headers': '*',
  };

  Future signupUser(User user) async {
    var url = Uri.http(urlOrigin, '/api/user');
    try {
      var response = await http.post(
        url,
        body: convert.jsonEncode(user.toJson()),
        headers: header,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse;
      } else {
        return 'True';
      }
    } catch (e) {
      return 'True';
    }
  }

  Future signinUser(String username, String passwrod) async {
    var url = Uri.http(urlOrigin, '/api/Users/' + username + '/' + passwrod);
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = convert.jsonDecode(response.body) as String;
        return jsonResponse;

        // var itemCount = jsonResponse['totalItems'];
        // print('Number of books about http: $itemCount.');
      } else {
        return 'True';
      }
    } catch (e) {
      return 'True';
    }
  }
}
