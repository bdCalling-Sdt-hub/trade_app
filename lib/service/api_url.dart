class ApiUrl {
  static const baseUrl = "http://192.168.10.14:5070";
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
  static const getCategory = "/category/get-all";
  static const getSubCategory = "/sub-category/get-all";
  static const allAdds = "/adds/all-adds";
  static const getSubProduct = "/product/get-all";
  static const addProduct = "/product/add-product";
  static const myProduct = "/product/my-products";
  static const editProduct = "/product/edit";
  static const deleteProduct = "/product/delete";
  static const productDetails = "/product/details";
  static const swapProduct = "/swap/make-swap";
  static const swapHistory = "/swap/swap-histoy";
  static const swapMyReq = "/swap/pending-swap?status=my_request";
  static const swapTheirReq = "/swap/pending-swap?status=receive_request";
  static const termsCondition = "/rules/get-rules";
  static const privacyPolicy = "/rules/get-facts";
  static const changePassword = "/auth/change-password";
}
