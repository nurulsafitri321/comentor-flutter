import 'package:comentor_auth/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                hintText: "Masukkan nama anda",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                hintText: "Masukkan email anda",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Masukkan password anda",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.passwordConfirmController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Konfirmasi password anda",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.showOverlay(
                  asyncFunction: controller.handleRegister,
                  loadingWidget: Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.purple,
                      size: 24,
                    ),
                  ),
                );
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
