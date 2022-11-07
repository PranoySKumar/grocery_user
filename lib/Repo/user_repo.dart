import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/User/user_model.dart';
import 'api.dart';

class UserRepo {
  static const String _login = "/login";

  static Future<LoginResponse> login(User user) async {
    var response = await http.post(Uri.parse(Api.baseUrl + _login),
        headers: Api.defaultHeaders, body: jsonEncode(user.toJson));
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse(User.fromJson(data["user"]), data["token"]);
    } else {
      throw Exception("something went wrong during login");
    }
  }

  static Future<Map<String, dynamic>> verifyPhoneNumber(String phoneNumber) async {
    var response = await http.get(Uri.parse(Api.verifyPhoneNumberUrl(phoneNumber)));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      print(response.body);
      throw Exception("something went wrong during phonenumber verification");
    }
  }

  static Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String code) async {
    var response = await http.post(Uri.parse(Api.verifyOtpUrl(phoneNumber, code)));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      throw Exception("something went wrong during otp verification");
    }
  }
}

//responses;
class LoginResponse {
  final User user;
  final String token;
  LoginResponse(this.user, this.token);
}
