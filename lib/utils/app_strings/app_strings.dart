class AppStrings {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String passDoesNotMatch = "Password does not match";
  static const String passwordMustHaveEightWith =
      "Password must have 8 characters With(A-z,a-z,0-9)";
  static const String enterValidEmail = "Enter a valid email";
  static const String passMustContainBoth =
      "Password must be 8 characters long & must include one capital letter";

  ///===========================Authentication All Strings Here==============
  static const String enterAValidName = "Enter a valid name";
  static const String enterValidEamil = "Please Enter Your Email Address";
  static const String passwordLengthAndContain =
      "Password must be 8 characters long & must include one capital letter";
  static const String signIn = "Sign in";
  static const String welcomeBack = "Welcome Back!";
  static const String email = "Email";
  static const String password = "Password";
  static const String enterYourEmail = "Enter your email";
  static const String enterYourPassword = "Enter your password";
  static const String rememberMe = "Remember Me";
  static const String forgotPassword = "Forgot password?";
  static const String signUp = "Sign up";
  static const String verificationCode = "Verification Code ";
  static const String continues = "Continue";
  static const String weSendYouAVerificationCode = "We send you a verification code to verify your email.";
  static const String mobileNumber = "Mobile Number";
  static const String enterYourCodeHere = "Enter your code here";
  static const String address = "Address (Optional)";
  static const String resetPassword = "Reset Password";
  static const String setTheNewPasswordFor = "Set the new password for your account";
  static const String confirmPassword = "Confirm Password";
  static const String enterNewPassword = "Enter New Password";
  static const String justAFewQuickThingsToGet = "Just a few quick things to get started";
  static const String dontHaveAnAccount = "Don’t have an account?";
  static const String reTypeYourPassword = "Retype your password";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String iAgreeWithTheTermsAnd = "I agree with the terms and condition";
  static const String pleaseSignInToContinueAccess = "Please sign in to continue access";
  static const String enterYourEmailAndWeWillSendYou = "Enter your email and we will send you a varification code";

///=========================My Profile String=======================
  static const String myProfile = "My Profile";
  static const String myMembership = "My Membership";
  static const String myProducts = "My Products";
  static const String swapRequests = "Swap Requests";
  static const String swapHistory = "Swap History";
  static const String myRatingAndComments = "My Rating & Comments";

  ///======================Settings ============================
  static const String settings = "Settings";
  static const String general = "General";
  static const String accountInfo = "Account Info";
  static const String changePassword = "Change Password";
  static const String language = "Language";
  static const String addresss = "Address";
  static const String termsAndConditions = "Terms & Condition";
  static const String privacyPolicy = "Privacy Policy";
  static const String helpCenter = "Help Center";

  ///=====================Personal Info===================
  static const String personalInfo = "Personal info";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String update = "Update";

  ///=========================Change Password ==================
  static const String setYourNewPassword = "Set your new password";
  static const String enterCurrentPassword = "Enter Current Password";
  static const String retypeNewPassword = "Retype New Password";
  static const String selectYourLanguage = "Select your language";
  static const String english = "English";
  static const String spanish = "Spanish";

}
