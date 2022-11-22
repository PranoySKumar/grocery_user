import 'package:grocery_user/Model/LatLng/latlng_model.dart';

import '../../Model/User/user_model.dart';
import '../api_service.dart';

class UserProvider extends ApiService {
  String get _userLoginUrl => "$baseUrl/auth";
  String _verifyPhoneNumberUrl(String phoneNumber) => "$baseUrl/auth/$phoneNumber";
  String _verifyOtpUrl(String phoneNumber, code) => "$baseUrl/auth/$phoneNumber/otp/$code";

  Future<LoginResponse> login(
      {int? phoneNumber, String? userName, int? pincode, LatLng? location}) async {
    try {
      //preparing request body;
      var requestBody = <String, dynamic>{
        "userName": userName,
        "pincode": pincode,
        "location": location?.toJson,
        "phoneNumber": phoneNumber,
      };

      var response = await post(
        _userLoginUrl,
        requestBody,
      );

      if (response.statusCode == 201) {
        var data = response.body as Map<String, dynamic>;
        print("data $data");
        return LoginResponse(User.fromJson(data["user"]), data["token"]);
      } else {
        throw Exception("something went wrong during login");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyPhoneNumber(String phoneNumber) async {
    var response = await get(_verifyPhoneNumberUrl(phoneNumber));
    if (response.statusCode == 200) {
      return response.body as Map<String, dynamic>;
    } else {
      throw Exception("something went wrong during phonenumber verification");
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String code) async {
    var response = await get(
      _verifyOtpUrl(phoneNumber, code),
    );
    if (response.statusCode == 200) {
      return response.body as Map<String, dynamic>;
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
