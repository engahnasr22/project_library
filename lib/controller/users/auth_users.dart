import 'dart:convert';
import 'package:app_library/constant/api_url.dart';
import 'package:app_library/controller/users/user.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<User?> register(
      String firstName, String lastName, String email, String password) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    Map<String, String> body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    };

    http.Response response = await http.post(
        Uri.parse(ApiUtilUrl.userRegisterAuth),
        headers: headers,
        body: body);

    if (response.statusCode == 201) {
      var body = jsonDecode(response.body);
      var data = body['data'];
      return User.fromjson(data);
    }
    return null;
  }

  Future<User?> login(String email, String password) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    Map<String, String> body = {'email': email, 'password': password};
    http.Response response = await http.post(
        Uri.parse(ApiUtilUrl.userLoginAuth),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var data = body['data'];
      return User.fromjson(data);
    }
    return null;
  }
}
