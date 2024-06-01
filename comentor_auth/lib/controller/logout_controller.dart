import 'dart:convert';

import 'package:comentor_auth/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../screens/login_screen.dart';

class LogoutController extends GetxController {

  Future<void> handlelogout() async {
    final uri = Uri.parse("https://fnproject.my.id/api/auth/logout");

    final prefs = await SharedPreferences.getInstance();
    final token =  prefs.getString('token');

    final response = await http.post(
      uri,
      headers: {
        "Authorization": "Bearer $token",
      },
      
    );
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.snackbar(responseBody["status"],responseBody["message"]);
      Get.to(const LoginScreen());
    } else {
      Get.snackbar(responseBody["status"], responseBody["message"]);
      
    }
  }
}
