class ApiUrl {
  static const baseUrl = "http://192.168.10.152:5070";
  static const imageBaseUrl = '$baseUrl/';
  static socketUrl({String userID = ""}) => '$baseUrl?userId=$userID';

  /// ============================ Auth ==============================

  static const register = "/auth/register";
  static const resend = "/auth/resend-active";
  static const activeUser = "/auth/activate-user";
  static const login = "/auth/login";
}
