import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/firebase_const.dart';
import 'package:e_faultz/view/home_screen/home.dart';
import 'package:e_faultz/widget_common/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_screen.dart/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating method to change the page for 3 sec after
  changePage() {
    Future.delayed(const Duration(seconds: 3), () {
      // using getx to navigate to login screen
      // Get.to(() =>  LoginScreen());
      //checking the user in or out
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            appLogo(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).color(whiteColor).make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            2.heightBox

            // spalsh screen almost completed
          ],
        ),
      ),
    );
  }
}
