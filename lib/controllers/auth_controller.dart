import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/routes/app_routes.dart';

class AuthController extends GetxController {
  static String? token;
  static UserModel? userModel;
  
  final _isLoggedIn = false.obs;
  
  bool get isLoggedIn => _isLoggedIn.value;

  static Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    final userData = sharedPreferences.getString('user');
    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
    }
    return token != null && userModel != null;
  }

  static Future<void> saveUserData(String userToken, UserModel model) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));
    token = userToken;
    userModel = model;
  }

  static Future<void> clearAuthData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    userModel = null;
  }

  // GetX specific methods
  Future<bool> checkAuthState() async {
    final isLoggedIn = await isUserLoggedIn();
    _isLoggedIn.value = isLoggedIn;
    return isLoggedIn;
  }

  Future<void> logout() async {
    await clearAuthData();
    _isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.signIn);
  }
} 