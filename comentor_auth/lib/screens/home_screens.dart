import 'package:comentor_auth/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LogoutController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.showOverlay(
                      asyncFunction: controller.handlelogout,
                      loadingWidget: Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.purple,
                          size: 24,
                        ),
                      ),
                    );
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
