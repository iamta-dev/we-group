import 'package:example_flutter1/screens/Login/login.dart';
import 'package:example_flutter1/screens/home.dart';
import 'package:example_flutter1/screens/login/login_controller.dart';
import 'package:example_flutter1/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.prompt().fontFamily,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
            name: "/login",
            page: () => LoginScreen(),
            binding: BindingsBuilder(() {})),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
        )
      ],
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {}
}
