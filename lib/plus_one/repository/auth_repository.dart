
import '../service/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> registerUser(String email, String password, String role) {
    return _apiService.post("users/create", {"email": email, "password": password, "role": role,});
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) {
    return _apiService.post("auth/login", {"email": email, "password": password,});
  }

  Future<Map<String, dynamic>> verifyOtp(String otp, String token) {
    return _apiService.post("users/create-user-verify-otp", {"otp": otp}, token: token);
  }

  Future<Map<String, dynamic>> resendOtp(String otp, String token) {
    return _apiService.patch("otp/resend-otp", {"otp": otp}, token: token);
  }
  Future<Map<String, dynamic>> isEmailExist(String email) {
    return _apiService.get("users/email-exist?email=$email");
  }

  Future<Map<String, dynamic>> sendOtpToEmail(String email) async {
    return _apiService.post("auth/forgot-password-otpByEmail", {"email": email},);
  }

  /*
  Future<Map<String, dynamic>> sendOtpToPhone(String email) async {
    return _apiService.post("auth/forgot-password-otpByEmail", {"email": email},);
  }
   */

  Future<Map<String, dynamic>> verifyOtpForForgetPassword(String otp, String token) {
    return _apiService.patch("auth/forgot-password-otp-match", {"otp": otp}, token: token);
  }

  Future<Map<String, dynamic>> resetPassword(String newPassword, String confirmPassword, String token) {
    return _apiService.patch(
      "auth/forgot-password-reset",{"newPassword": newPassword, "confirmPassword": confirmPassword}, token: token,);
  }


}
