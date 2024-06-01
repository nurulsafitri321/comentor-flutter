import 'dart:convert';

import 'package:comentor_auth/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> handlelogin() async {
    final uri = Uri.parse("https://fnproject.my.id/api/auth/login");

    final response = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "email": emailController.text,
          "password": passwordController.text,
        },
      ),
    );
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final model = UserModel.fromJson(responseBody);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', model.data.token.toString());
      Get.snackbar(model.status.toString(), model.message.toString());
      Get.offAll(const HomeScreen());
    } else {
      Get.snackbar(responseBody["status"], responseBody["message"]);
      
    }
  }
}
