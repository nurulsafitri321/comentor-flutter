import 'package:comentor_auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  hintText: "Masukkan email anda",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  hintText: "Masukkan password anda",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.showOverlay(
                      asyncFunction: controller.handlelogin,
                      loadingWidget: Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.purple,
                          size: 24,
                        ),
                      ),
                    );
                  },
                  child: const Text("Login"))
            ],
          ),
        ));
  }
}
