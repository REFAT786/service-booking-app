import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:service_booking_app/utils/app_url.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> registerUser(
      String email, String password, String role) {
    return _apiService.post(AppUrl.createUser, {"email": email, "password": password, "role": role,});
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) {
    return _apiService.post(AppUrl.login, {"email": email, "password": password,});
  }

  Future<Map<String, dynamic>> verifyOtp(String otp, String token) {
    return _apiService.post(AppUrl.createUserVerifyOtp, {"otp": otp}, token: token);
  }

  Future<Map<String, dynamic>> resendOtp(String otp, String token) {
    return _apiService.patch(AppUrl.resendOtp, {"otp": otp}, token: token);
  }

  Future<Map<String, dynamic>> isEmailExist(String email) {
    return _apiService.get("${AppUrl.emailExist}?email=$email");
  }

  Future<Map<String, dynamic>> sendOtpToEmail(String email) async {
    return _apiService.post(AppUrl.sendOtpToEmail, {"email": email},);
  }

  /*
  Future<Map<String, dynamic>> sendOtpToPhone(String phone) async {
    return _apiService.post(AppUrl.sendOtpToPhone, {"phone": phone},);
  }
   */

  Future<Map<String, dynamic>> verifyOtpForForgetPassword(String otp, String token) {
    return _apiService.patch(AppUrl.verifyOtpForForgetPassword, {"otp": otp}, token: token);
  }

  Future<Map<String, dynamic>> resetPassword(String newPassword, String confirmPassword, String token) {
    return _apiService.patch(AppUrl.resetPassword, {"newPassword": newPassword, "confirmPassword": confirmPassword}, token: token,);
  }

  Future<Map<String, dynamic>> updateUserInterests(List<String> interests, String token) {
    return _apiService.patch(AppUrl.updateUserProfile, {"interests": interests}, token: token,);
  }

  // Update user profile (non-file fields)
  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> profileData, String token) {
    return _apiService.patch("users/update-my-profile", profileData, token: token);
  }

  /*
  // Update user profile (with files)
  Future<Map<String, dynamic>> updateUserProfileWithFiles({
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    required String token,
  }) {
    return _apiService.multipartPatch(
      AppUrl.updateUserProfile,
      fields: fields,
      files: files,
      token: token,
    );
  }

   */

  Future<UserModel> updateUserProfileWithFiles({
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    required String token,
  }) async {
    final response = await _apiService.multipartPatch(
      AppUrl.updateUserProfile,
      fields: fields,
      files: files,
      token: token,
    );
    return UserModel.fromJson(response['data']);
  }

  /*
  // Fetch user profile
  Future<Map<String, dynamic>> getUserProfile(String token) {
    return _apiService.get(AppUrl.getUserProfileInfo, token: token);
  }
   */

  Future<UserModel> getUserProfile(String token) async {
    final response = await _apiService.get(AppUrl.getUserProfileInfo, token: token);
    return UserModel.fromJson(response['data']);
  }


}
