import 'package:get_storage/get_storage.dart';

class Api {
  //headers
  static final Map<String, String> defaultHeaders = {
    "Authorization": "Bearer ${GetStorage().read("token")}"
  };
  static const String baseUrl = "http://localhost:4000/user";

  static String verifyPhoneNumberUrl(String phoneNumber) => "$baseUrl/auth/verify/$phoneNumber";
  static String verifyOtpUrl(String phoneNumber, code) =>
      "$baseUrl/auth/verify/$phoneNumber/otp/$code";
}
