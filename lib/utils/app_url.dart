class AppUrl{

  static const  baseUrl = "http://10.0.70.112:8010/api/v1";

  static const createUser = "users/create";
  static const login = "auth/login";
  static const createUserVerifyOtp = "users/create-user-verify-otp";
  static const resendOtp = "otp/resend-otp";
  static const emailExist = "users/email-exist";
  static const sendOtpToEmail = "auth/forgot-password-otpByEmail";
  static const sendOtpToPhone = "auth/forgot-password-otpByPhone";
  static const verifyOtpForForgetPassword = "auth/forgot-password-otp-match";
  static const resetPassword = "auth/forgot-password-reset";
  static const updateUserProfile = "users/update-my-profile";
  static const getUserProfileInfo = "users/my-profile";

}