import 'package:get/get.dart';

import '../../plus_one/repository/auth_repository.dart';
import '../../plus_one/service/api_service.dart';
import '../../plus_one/views/auth/create_new_password/controller/create_new_passport_controller.dart';
import '../../plus_one/views/auth/fill_profile/controller/fill_profile_controller.dart';
import '../../plus_one/views/auth/forget_password/controller/forget_password_controller.dart';
import '../../plus_one/views/auth/forget_password/controller/select_platform_for_otp_controller.dart';
import '../../plus_one/views/auth/login/controller/loginController.dart';
import '../../plus_one/views/auth/otp/controller/otp_controller.dart';
import '../../plus_one/views/auth/sign_up/controller/sign_up_controller.dart';
import '../../plus_one/views/calender_screen/controller/calender_controller.dart';
import '../../plus_one/views/chat_screen/controller/chat_controller.dart';
import '../../plus_one/views/chat_screen/controller/chatting_controller.dart';
import '../../plus_one/views/event_screen/controller/create_event_controller.dart';
import '../../plus_one/views/event_screen/controller/event_detail_controller.dart';
import '../../plus_one/views/event_screen/controller/event_screen_controller.dart';
import '../../plus_one/views/event_screen/controller/feature_event_controller.dart';
import '../../plus_one/views/event_screen/controller/my_event_controller.dart';
import '../../plus_one/views/explore_screen/controller/explore_controller.dart';
import '../../plus_one/views/home/controller/home_controller.dart';
import '../../plus_one/views/invitation_screen/controller/invitation_controller.dart';
import '../../plus_one/views/plus_one_profile/profile/controller/profile_controller.dart';
import '../../plus_one/views/plus_one_profile/review/controller/review_controller.dart';
import '../../plus_one/views/plus_one_profile/companion_profile/controller/seeker_companion_profile_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);

    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => OtpController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => SelectPlatformForOtpController(), fenix: true);
    Get.lazyPut(() => CreateNewPassportController(), fenix: true);

    Get.lazyPut(() => FillProfileController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SeekerCompanionProfileController(), fenix: true);
    Get.lazyPut(() => FeatureEventController(), fenix: true);
    Get.lazyPut(() => CalenderController(), fenix: true);
    Get.lazyPut(() => EventScreenController(), fenix: true);
    Get.lazyPut(() => InvitationController(), fenix: true);
    Get.lazyPut(() => MyEventController(), fenix: true);
    Get.lazyPut(() => EventDetailController(), fenix: true);
    Get.lazyPut(() => CreateEventController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => ChattingController(), fenix: true);
    Get.lazyPut(() => ExploreController(), fenix: true);
    Get.lazyPut(() => ReviewController(), fenix: true);

  }
}
