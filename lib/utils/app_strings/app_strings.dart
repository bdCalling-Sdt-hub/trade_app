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
  static const String enterYourFirstName = "Enter your first name";
  static const String enterYourAddress = "Enter your address";
  static const String enterYourLastName = "Enter your last name";
  static const String swapPointsHistory = "Swap Points History:";
  static const String passwordLengthAndContain =
      "Password must be 8 characters long & must include one capital letter";
  static const String signIn = "Sign in";
  static const String thankYou = "Thank You!";
  static const String youSuccess =
      "You successfully applied for gold membership. Please wait for the approval. We will send you a confirmation email.";
  static const String welcomeBack = "Welcome Back!";
  static const String email = "Email";
  static const String rating = "Rating";
  static const String password = "Password";
  static const String resendOtp = "Resend Otp";
  static const String passwordShould = "Password should match";
  static const String enterYourEmail = "Enter your email";
  static const String enterYourNumber = "Enter your number";
  static const String enterYourPassword = "Enter your password";
  static const String retypeYourPassword = "Retype your password";
  static const String rememberMe = "Remember Me";
  static const String subCategory = "Sub Category";
  static const String forgotPassword = "Forgot password?";
  static const String signUp = "Sign up";
  static const String noDataFound = "No Data Found";
  static const String verificationCode = "Verification Code ";
  static const String continues = "Continue";
  static const String weSendYouAVerificationCode =
      "We send you a verification code to verify your email.";
  static const String mobileNumber = "Mobile Number (Optional)";
  static const String enterYourCodeHere = "Enter your code here";
  static const String address = "Address (Optional)";
  static const String resetPassword = "Reset Password";
  static const String setTheNewPasswordFor =
      "Set the new password for your account";
  static const String confirmPassword = "Confirm Password";
  static const String enterNewPassword = "Enter New Password";
  static const String justAFewQuickThingsToGet =
      "Just a few quick things to get started";
  static const String dontHaveAnAccount = "Don’t have an account?";
  static const String reTypeYourPassword = "Retype your password";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String iAgreeWithTheTermsAnd =
      "I agree with the ";
  static const String pleaseSignInToContinueAccess =
      "Please sign in to continue access";
  static const String enterYourEmailAndWeWillSendYou =
      "Enter your email and we will send you a varification code";

  ///=========================My Profile String=======================
  static const String myProfile = "My Profile";
  static const String logOut = "Log Out";
  static const String myMembership = "My Membership";
  static const String uploadPhoto = "Upload Photo";
  static const String myProducts = "My Products";
  static const String swapRequests = "Swap Requests";
  static const String swapHistory = "Swap History";
  static const String myRatingAndComments = "My Rating & Comments";
  static const String totalPointsEarn = "Total Points Earn";
  static const String monthlySubscriptionFee = "Monthly Subscription Fee ";
  static const String payNow = "Pay Now";
  static const String yourMembershipBenefits = "Your Membership Benefits:";
  static const String canExchangeProducts = "Can exchange products";
  static const String earnUpTo1000 = "Earn upto 1000 points by a single swap";
  static const String payYourSubscriptionFeeInTime =
      "Pay your subscription fee in time otherwise you may lose your points or downgrade your membership.";

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
  static const String gold = "Gold";
  static const String platinum = "Platinum";
  static const String diamond = "Diamond";

  ///===========================Address=====================
  static const String fillUpYourAddressDetails = "Fill up your address details";
  static const String city = "City";
  static const String zipCode = "Zip Code";
  static const String streetAddress = "Street Address";

  ///====================Swap================
  static const String pointsEarn = "Points Earn";
  static const String availableProducts = "Available Products";
  static const String myProductDetails = "My Product Details";
  static const String edit = "Edit";
  static const String delete = "Delete";
  static const String viewDetails = "View Details";
  static const String accept = "Accept";
  static const String reject = "Reject";
  static const String swapItems = "Swap Items";
  static const String swappedWith = "Swapped with";
  static const String review = "Review";
  static const String overallRating = "Overall Rating:";
  static const String allRatingAndComments = "All Rating & Comments";

  ///==========================Help Center====================
  static const String howCanWeHelpYou = "How can we help you?";
  static const String searchYourQuestionHere = "Search your questions here";
  static const String frequentlyAskedQuestions = "Frequently Asked Questions ";
  static const String needMoreHelp = "Need More Help?";
  static const String ourHelpLineServiceIsActive =
      "Our help line service is active: 24/7";

  ///=========================Change Password ==================
  static const String setYourNewPassword = "Set your new password";
  static const String enterCurrentPassword = "Enter Current Password";
  static const String retypeNewPassword = "Retype New Password";
  static const String selectYourLanguage = "Select your language";
  static const String english = "English";
  static const String spanish = "Spanish";

  ///==================================Home section===================
  static const String whatAreYouLookingFor = "What are you looking for?";
  static const String topSearch = "Top search";
  static const String search = "Search";
  static const String popularCategory = "Popular Category";
  static const String viewAll = "View All";
  static const String topProducts = "Top Products";
  static const String membershipPackages = "Membership Packages";
  static const String justForYou = "Just For You";

  ///============================Subscription=====================
  static const String goldMembership = "Gold Membership";
  static const String applyForMembership = "Apply for Membership";
  static const String goldMembershipBenefits = "Gold Membership Benefits:";
  static const String platinumMembership = "Platinum Membership";
  static const String diamondMembership = "Diamond Membership";
  static const String preApprovalQuestions = "Pre-Approval Questions";
  static const String pleaseFillUpThisForm = "Please Fill-up this form:";
  static const String name = "Name";
  static const String dateOfBirth = "Date of Birth";
  static const String placeOfBirth = "Place of Birth";
  static const String licenceNo = "License No ";
  static const String passport = "Passport";
  static const String phoneNumber = "Phone Number";
  static const String profession = "Profession";
  static const String whatYourReligion = "What’s your religion? (optional)";
  static const String next = "Next";
  static const String back = "Back";
  static const String datesOfTravel = "Dates of travel?";
  static const String travelStart = "Travel Start";
  static const String destination = "Destination";
  static const String state = "State";
  static const String country = "Country";
  static const String county = "County";
  static const String travelEnd = "Travel End";
  static const String purposeOfTravel = "Purpose of travel?";
  static const String business = "Business";
  static const String pleasure = "Pleasure";
  static const String recreational = "Recreational";
  static const String submit = "Submit";

  ///=============================Notifications====================
  static const String notifications = "Notifications";

  ///========================Categories=======================
  static const String categories = "Categories";
  static const String filter = "Filter";
  static const String value = "Value:";

  ///==========================Products details=================
  static const String productDetails = "Product Details";
  static const String postBy = "Post by";
  static const String condition = "Condition:";
  static const String used = "Used";
  static const String description = "Description: ";
  static const String iWantToSwapFor = "I want to Swap for:";
  static const String sendSwapRequest = "Send Swap Request";
  static const String similarProducts = "Similar Products";
  static const String swapProduct = "Swap Product";
  static const String selectedProduct = "Selected Product";
  static const String call = "Call";
  static const String postedOn = "Posted on";
  static const String membershipStatus = "Membership status:";
  static const String memberSince = "Member Since: ";
  static const String lastSiteVisit = "Last site visit: ";
  static const String availableItemsForSwap = "Available Items for Swap";
  static const String ratingAndComments = "Rating & Comments";

  ///==============================Post========================
  static const String postAnAd = "Post an Ad";
  static const String pleaseChooseACategory = "Please Choose a Category";
  static const String productCategory = "Product Category";
  static const String productTitle = "Product Title";
  static const String productValue = "Product Value ";
  static const String editAd = "Edit Ad";
  static const String addPhoto = "Add Photo";
  static const String postAd = "Post Ad";
  static const String chat = "Chat";
}
