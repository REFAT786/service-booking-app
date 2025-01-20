import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:service_booking_app/plus_one/views/auth/forget_password/screen/select_platform_for_otp_screen.dart';
import 'package:service_booking_app/routes/routes_name.dart';
import '../plus_one/splash_screen.dart';
import '../plus_one/views/auth/create_new_password/screen/create_new_passport_screen.dart';
import '../plus_one/views/auth/fill_profile/screen/fill_profile_screen.dart';
import '../plus_one/views/auth/forget_password/screen/forget_password_screen.dart';
import '../plus_one/views/auth/login/screen/login_screen.dart';
import '../plus_one/views/auth/otp/screen/otp_screen.dart';
import '../plus_one/views/auth/sign_up/screen/sign_up_screen.dart';
import '../plus_one/views/calender_screen/screen/calender_screen.dart';
import '../plus_one/views/chat_screen/screen/chat_screen.dart';
import '../plus_one/views/chat_screen/screen/chatting_screen.dart';
import '../plus_one/views/event_screen/screen/create_event_screen.dart';
import '../plus_one/views/event_screen/screen/event_detail_screen.dart';
import '../plus_one/views/event_screen/screen/event_screen.dart';
import '../plus_one/views/event_screen/screen/feature_event_screen.dart';
import '../plus_one/views/event_screen/screen/my_event_details_screen.dart';
import '../plus_one/views/event_screen/screen/save_event_screen.dart';
import '../plus_one/views/home/screen/home_screen.dart';
import '../plus_one/views/intro/screen/intro_screen.dart';
import '../plus_one/views/invitation_screen/screen/invitation_screen.dart';
import '../plus_one/views/nav_bar_screen/nav_bar_screen.dart';
import '../plus_one/views/notification/screen/notification_screen.dart';
import '../plus_one/views/plus_one_profile/screen/change_password_screen.dart';
import '../plus_one/views/plus_one_profile/screen/edit_profile_screen.dart';
import '../plus_one/views/plus_one_profile/screen/help_center_screen.dart';
import '../plus_one/views/plus_one_profile/screen/language_screen.dart';
import '../plus_one/views/plus_one_profile/screen/notification_setting_screen.dart';
import '../plus_one/views/plus_one_profile/screen/plus_one_companion_profile_screen.dart';
import '../plus_one/views/plus_one_profile/screen/privacy_policy_screen.dart';
import '../plus_one/views/plus_one_profile/profile/screen/profile_screen.dart';
import '../plus_one/views/plus_one_profile/review/screen/review_screen.dart';
import '../plus_one/views/plus_one_profile/screen/security_screen.dart';
import '../seekers/views/give_review/screen/give_review_screen.dart';
import '../seekers/views/home/screen/seeker_home_screen.dart';
import '../seekers/views/seeker_companion_profile/seeker_companion_profile_screen.dart';


class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.getSplashScreen(),
          page: () => SplashScreen(),
        ),
        GetPage(
          name: RoutesName.getIntroScreen(),
          page: () => IntroScreen(),
        ),
        GetPage(
          name: RoutesName.getLoginScreen(),
          page: () => LoginScreen(),
        ),
        GetPage(
          name: RoutesName.getSignUpScreen(),
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: RoutesName.getForgetPasswordScreen(),
          page: () => ForgetPasswordScreen(),
        ),
        GetPage(
          name: RoutesName.getOtpScreen(),
          page: () => OtpScreen(),
        ),
        GetPage(
          name: RoutesName.getCreateNewPasswordScreen(),
          page: () => CreateNewPassportScreen(),
        ),
        GetPage(
          name: RoutesName.getFillProfileScreen(),
          page: () => FillProfileScreen(),
        ),
        GetPage(
          name: RoutesName.getHomeScreen(),
          page: () => HomeScreen(),
        ),
        GetPage(
          name: RoutesName.getNavBarScreen(),
          page: () => NavBarScreen(),
        ),
        GetPage(
          name: RoutesName.getSeekerProfileScreen(),
          page: () => PlusOneCompanionProfileScreen(),
        ),
        GetPage(
          name: RoutesName.getCalenderScreen(),
          page: () => CalenderScreen(),
        ),
        GetPage(
          name: RoutesName.getInvitationScreen(),
          page: () => InvitationScreen(),
        ),
        GetPage(
          name: RoutesName.getEventScreen(),
          page: () => EventScreen(),
        ),
        GetPage(
          name: RoutesName.getFeatureEventScreen(),
          page: () => FeatureEventScreen(),
        ),
        GetPage(
          name: RoutesName.getEventDetailScreen(),
          page: () => EventDetailScreen(),
        ),
        GetPage(
          name: RoutesName.getChatScreen(),
          page: () => ChatScreen(),
        ),
        GetPage(
          name: RoutesName.getChattingScreen(),
          page: () => ChattingScreen(),
        ),
        GetPage(
          name: RoutesName.getEditProfileScreen(),
          page: () => EditProfileScreen(),
        ),
        GetPage(
          name: RoutesName.getNotificationScreen(),
          page: () => NotificationSettingScreen(),
        ),
        GetPage(
          name: RoutesName.getHelpCenterScreen(),
          page: () => HelpCenterScreen(),
        ),
        GetPage(
          name: RoutesName.getPrivacyPolicyScreen(),
          page: () => PrivacyPolicyScreen(),
        ),
        GetPage(
          name: RoutesName.getReviewScreen(),
          page: () => ReviewScreen(),
        ),
        GetPage(
          name: RoutesName.getCreateScreen(),
          page: () => CreateEventScreen(),
        ),
        GetPage(
          name: RoutesName.getMyEventDetailsScreen(),
          page: () => MyEventDetailsScreen(),
        ),
        GetPage(
          name: RoutesName.getProfileScreen(),
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: RoutesName.getLanguageScreen(),
          page: () => LanguageScreen(),
        ),
        GetPage(
          name: RoutesName.getSecurityScreen(),
          page: () => SecurityScreen(),
        ),
        GetPage(
          name: RoutesName.getSeekerHomeScreen(),
          page: () => SeekerHomeScreen(),
        ),
        GetPage(
          name: RoutesName.getSeekerCompanionProfileScreen(),
          page: () => SeekerCompanionProfileScreen(),
        ),
        GetPage(
          name: RoutesName.getSaveEventScreen(),
          page: () => SaveEventScreen(),
        ),
    GetPage(
      name: RoutesName.getGiveReviewScreen(),
      page: () => GiveReviewScreen(),
    ),
    GetPage(
      name: RoutesName.getNotificationScreen(),
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: RoutesName.getChangePasswordScreen(),
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: RoutesName.getSelectPlatformForOtpScreen(),
      page: () => SelectPlatformForOtpScreen(),
    ),

      ];
}
