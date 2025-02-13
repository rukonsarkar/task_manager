import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: controller.setEmail,

              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: controller.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24),
            Obx(() => controller.isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: controller.login,
                  child: Text('Login'),
                ),
            ),
          ],
        ),
      ),
    );
  }
} 