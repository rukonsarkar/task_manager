import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screens.dart';
import 'package:task_manager/ui/screens/forgor_password_email_verification.dart';
import 'package:task_manager/ui/screens/forgot_password_otp_verification.dart';
import 'package:task_manager/ui/screens/recovary_password_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/routes/app_routes.dart';
import 'package:task_manager/bindings/app_binding.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'poppins',
        colorSchemeSeed: AppColors.themColor,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 28,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xff2e374f),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'roboto',
            color: Color(0xff989898),
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400,
            color: Color(0xff5f5f5f),
          ),
          labelLarge: TextStyle(
            fontSize: 13,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xff2e374f),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themColor,
            foregroundColor: Colors.white,
            fixedSize: Size.fromWidth(double.maxFinite),
            textStyle: TextStyle(fontSize: 16),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontSize: 11,
            fontFamily: 'roboto',
            fontWeight: FontWeight.w300,
            color: Color(0xffc0c0c0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      initialRoute: AppRoutes.splash,
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
        GetPage(name: AppRoutes.signIn, page: () => const SignInScreen()),
        GetPage(name: AppRoutes.signUp, page: () => const SignUpScreen()),
        GetPage(
          name: AppRoutes.forgotPasswordEmail, 
          page: () => const ForgorPasswordEmailVerification()
        ),
        GetPage(
          name: AppRoutes.forgotPasswordOtp,
          page: () => ForgorPasswordOtpVerification(gmail: Get.arguments)
        ),
        GetPage(
          name: AppRoutes.recoveryPassword,
          page: () => RecovaryPasswordScreen(emailAndOtp: Get.arguments)
        ),
        GetPage(
          name: AppRoutes.mainBottomNav, 
          page: () => const MainBottomNavScreen()
        ),
        GetPage(
          name: AppRoutes.addNewTask, 
          page: () => const AddNewTaskScreen()
        ),
        GetPage(
          name: AppRoutes.updateProfile, 
          page: () => const UpdateProfileScreen()
        ),
      ],
    );
  }
}
