class UserApi {
  static const String sendUserOtpMutation = """
  mutation SendOtp(\$phoneNumber){
    sendUserOtp
  }
""";

  static const String verifyUserOtpMutation = """
  mutation VerifyOtp(\$code){
    verifyUserOtp
  }
""";

  static const String getUserDetailsQuery = """
  query UserDetails{
    user{
        id
        userName
        pincode
        profileImageUrl
        location{
          lat
          lng
        }
        coupons{
          id
        }
        favourites{
          id
        }
        shippingAddresses{
          recipientName
          address
          pincode
          landmark
        }
      }
  }
""";
  static const String loginUserMutation = """
  mutation LoginUser(\$data:UserLoginInput) {
   userLogin(data:\$data) {
      token,
      user{
        id
        userName
        pincode
        profileImageUrl
        location{
          lat
          lng
        }
        coupons{
          id
        }
        favourites{
          id
        }
        shippingAddresses{
          recipientName
          address
          pincode
          landmark
        }
      }
    }
  }
""";
  static const String updateUserMutation = """
  mutation LoginUser(\$data:UserInputType) {
   updateUser(data:\$data)
  }
""";
}
