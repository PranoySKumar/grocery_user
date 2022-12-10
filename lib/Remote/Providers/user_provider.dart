import 'package:grocery_user/Model/LatLng/latlng_model.dart';

import '../../Model/User/user_model.dart';
import '../api_service.dart';

class UserProvider extends ApiService {
  String get _userLoginUrl => "/auth";
  String _sendOtpUrl(String phoneNumber) => "/auth/$phoneNumber";
  String _verifyOtpUrl(String phoneNumber, code) => "/auth/$phoneNumber/otp/$code";
  String get _updateUserDataUrl => "/profile";
  String get _getUserDetails => "/profile";

  Future<LoginResponse> login(
      {int? phoneNumber, String? userName, int? pincode, LatLng? location}) async {
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
  }

  Future<Map<String, dynamic>> sendOtpPhoneNumber(String phoneNumber) async {
    var response = await get(_sendOtpUrl(phoneNumber));
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

  Future<Map<String, dynamic>> updateUserData(Map<String, dynamic> data) async {
    var response = await patch(_updateUserDataUrl, data);
    if (response.statusCode == 201) {
      return response.body as Map<String, dynamic>;
    } else {
      throw Exception("something went while updating user details.");
    }
  }

  Future<User> getUserDetails() async {
    var response = await get(_getUserDetails);
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      throw Exception("something went while updating user details.");
    }
  }
}

//responses;
class LoginResponse {
  final User user;
  final String token;
  LoginResponse(this.user, this.token);
}
