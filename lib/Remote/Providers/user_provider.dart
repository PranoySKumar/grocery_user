import 'package:grocery_user/Model/LatLng/latlng_model.dart';
import 'package:grocery_user/Remote/grapql_client.dart';

import '../../Model/User/user_model.dart';
import '../APIs/user_api.dart';

class UserProvider {
//User Login Otp
  Future<LoginResponse> userLogin(
      {required String phoneNumber, required String userName, LatLng? latLng, int? pincode}) async {
    //graphql variables
    var variables = {
      "data": {
        "location": latLng?.toJson,
        "userName": userName,
        "pincode": pincode,
        "phoneNumber": phoneNumber
      }
    };
    var data = await GraphqlActions.mutate(api: UserApi.loginUserMutation, variables: variables);
    var token = data?["userLogin"]["token"] as String;
    var userJSON = data?["userLogin"]["user"] as Map<String, dynamic>;

    var user = User.fromJson(userJSON);
    return LoginResponse(user, token);
  }

//Send User Otp
  Future<void> sendUserOtp(String phoneNumber) async {
    var data = await GraphqlActions.mutate(api: UserApi.sendUserOtpMutation);
  }

//Verify User Otp
  Future<void> verifyUserOtp(int code) async {
    var data = await GraphqlActions.mutate(api: UserApi.verifyUserOtpMutation);
  }

//Get User Details
  Future<User> getUserDetails() async {
    var data = await GraphqlActions.query(api: UserApi.getUserDetailsQuery);
    return User.fromJson(data?["user"] as Map<String, dynamic>);
  }

  //Update User Details
  Future<void> updateUserDetails(Map<String, dynamic> userDetails) async {
    var data = await GraphqlActions.mutate(
        api: UserApi.sendUserOtpMutation, variables: {"data": userDetails});
  }
}

//responses;
class LoginResponse {
  final User user;
  final String token;
  LoginResponse(this.user, this.token);
}
