class ApiUrl {
  static const baseUrl = "http://103.145.138.200:5070";
  static const imageBaseUrl = '$baseUrl/';
  static socketUrl({required String userID}) => 'http://103.145.138.200:5070?id=$userID';

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
  static const avgRating = "/review/average-ratting";
  static const myReview = "/review/my-reviews";
  static const profile = "/auth/profile";
  static const editProfile = "/auth/edit-profile";
  static const swapApprove = "/swap/approve";
  static const swapReject = "/swap/reject";
  static const swapDelete = "/swap/swap-delete/";
  static const swapDetails = "/swap/swap-details";
  static const reviewSend = "/review/send";
  static const partnerProfile = "/swap/partner_profile";
  static const subscriptionAll = "/subscription/all";
  static const subscriptionDetails = "/subscription/details";
  static const createPlan = "/plan/create-plan";
  static const paymentIntent = "/payment/payment-intent";
  static const planProfile = "/plan/profile";
  static const successIntent = "/payment/success_intent";
  static const allPoints = "/plan/all-points";
  static const getConversation = "/message/get-conversation";
  static getMessage({required int page, required String id})=> "$baseUrl/message/get-message/$id?page=$page&limit=20";
}
