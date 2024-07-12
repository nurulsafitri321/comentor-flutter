import 'package:comentor_auth/screens/home_screens.dart';
import 'package:comentor_auth/screens/login_screen.dart';
import 'package:comentor_auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final initial = token != null ? HomeScreen() : LoginScreen();

  runApp(MyApp(initial: initial));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initial});

  final Widget? initial;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: initial,
      getPages: [
        GetPage(name: '/', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}
