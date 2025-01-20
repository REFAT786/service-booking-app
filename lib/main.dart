import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:service_booking_app/core/core/dependency.dart';
import 'package:service_booking_app/routes/routes.dart';
import 'package:service_booking_app/routes/routes_name.dart';
import 'package:service_booking_app/utils/app_color.dart';
import 'package:service_booking_app/utils/app_string.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440,960),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.bg,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.getSplashScreen(),
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}
