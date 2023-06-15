import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/controller/auth_controller.dart';
import 'package:e_faultz/view/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget_common/app_logo.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/custom_button.dart';
import '../../widget_common/custom_textFeild.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController reenterPasswordController =
      TextEditingController();
  bool? ischeked = false;
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Sign up to $appname".text.white.size(16).fontFamily(bold).make(),
              10.heightBox,
              Obx(()=>
                 Column(
                  children: [
                    customTextFeild(
                      isPass: false,
                      controller: nameController,
                      hintText: nameHint,
                      textfeildText: name,
                    ),
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
                    customTextFeild(
                      isPass: true,
                      controller: reenterPasswordController,
                      hintText: password,
                      textfeildText: reEnterPass,
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
                    Row(
                      children: [
                        //using check box
                        Checkbox(
                          checkColor: redColor,
                          value: ischeked,
                          onChanged: (newValue) {
                            setState(() {
                              ischeked = newValue;
                            });
                          },
                        ),
                        5.widthBox,
                        // gonna use the text span
                        Expanded(
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                text: "I agree to the ",
                                style:
                                    TextStyle(fontFamily: bold, color: fontGrey),
                              ),
                              TextSpan(
                                text: termandcond,
                                style:
                                    TextStyle(fontFamily: bold, color: redColor),
                              ),
                              TextSpan(
                                text: " & ",
                                style:
                                    TextStyle(fontFamily: bold, color: fontGrey),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style:
                                    TextStyle(fontFamily: bold, color: redColor),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                   controller.isLoading == true
                        ? const Center(
                          child:  CircularProgressIndicator(
                            
                              valueColor: AlwaysStoppedAnimation(redColor),
                            ),
                        )
                        : customButton(
                      context: context,
                      color: ischeked == true ? redColor : lightGrey,
                      text: signup,
                      textColor: whiteColor,
                      onpress: () async {
                        // user firebase signin method
                        controller.isLoading(true);
                        if (ischeked != false) {
                          try {
                            await controller
                                .signinMethod(
                              context: context,
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              reenterPassword: reenterPasswordController.text,
                            ).then((value){
                              return controller.storeUserData(
                                
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                              );
                            }).then((value){
                              VxToast.show(context, msg: logedInsuccess);
                              Get.offAll(()=>const Home());
                            });
                               
                          } catch (e) {
                            controller.signoutMethod(context);
                            VxToast.show(context, msg: e.toString());
                            controller.isLoading(false);
                          }
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: alreadyaccount.text
                                .color(fontGrey)
                                .fontFamily(semibold)
                                .make()),
                        TextButton(
                          onPressed: () {
                            // navigate to login screen
                            Get.back();
                          },
                          child:
                              login.text.color(redColor).fontFamily(bold).make(),
                        ),
                      ],
                    )
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
