import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/controller/auth_controller.dart';
import 'package:e_faultz/view/auth_screen.dart/signup_screen.dart';
import 'package:e_faultz/widget_common/app_logo.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:e_faultz/widget_common/custom_button.dart';
import 'package:e_faultz/widget_common/custom_textFeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/list.dart';
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Login to $appname".text.white.size(16).fontFamily(bold).make(),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextFeild(
                      isPass: false,
                      controller: emailController,
                      hintText: emailHint,
                      textfeildText: email,
                    ),
                    customTextFeild(
                      isPass: true,
                      controller: passwordController,
                      hintText: passwordHint,
                      textfeildText: password,
                    ),
                    TextButton(
                      onPressed: () {
                        //create fuction for forget password
                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: forgetPass.text
                              .color(lightBlue)
                              .fontFamily(semibold)
                              .make()),
                    ),
                    5.heightBox,
                    controller.isLoading == true
                        ? const Center(
                          child:  CircularProgressIndicator(
                            
                              valueColor: AlwaysStoppedAnimation(redColor),
                            ),
                        )
                        : customButton(
                            context: context,
                            color: redColor,
                            text: login,
                            textColor: whiteColor,
                            onpress: () async {
                              // login method
                              controller.isLoading(true);
                              try {
                                await controller
                                    .loginMethod(
                                      email: emailController.text,
                                      password: passwordController.text,
                                  context: context,
                                )
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: logedInsuccess);
                                    Get.offAll(
                                      () => const Home(),
                                    );
                                  } else {
                                    controller.isLoading(false);
                                  }
                                });
                              } on FirebaseAuthException catch (e) {
                                VxToast.show(context, msg: e.toString());
                              }
                            },
                          ),
                    5.heightBox,
                    createNew.text.color(fontGrey).make(),
                    5.heightBox,
                    customButton(
                      context: context,
                      color: lightGolden,
                      text: signup,
                      textColor: redColor,
                      onpress: () {
                        //navigate to signup page
                        Get.to(() => const SignupScreen());
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        socialIconList.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .shadowSm
                    .width(context.screenWidth - 77)
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
