class ApiUrl {
  static const baseUrl = "http://192.168.10.152:5070";
  static const imageBaseUrl = '$baseUrl/';
  static socketUrl({String userID = ""}) => '$baseUrl?userId=$userID';

  /// ============================ Auth ==============================>
  static const register = "/auth/register";
  static const resend = "/auth/resend-active";
  static const activeUser = "/auth/activate-user";
  static const login = "/auth/login";
  static const forgotPassword = "/auth/forgot-password";
  static const resendVerify = "/auth/resend-verify";
  static const verifyOtp = "/auth/verify-otp";
  static const resetPassword = "/auth/reset-password";

  /// ============================ Auth ==============================>
  static const getTopProduct = "/product/get-top-products";
  static const justForYou = "/product/just-for-you";
}
