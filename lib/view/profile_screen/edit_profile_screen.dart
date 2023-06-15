import 'dart:io';

import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/controller/profile_controller.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:e_faultz/widget_common/custom_button.dart';
import 'package:e_faultz/widget_common/custom_textFeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(()=>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImagePath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(
                        controller.profileImagePath.value,
                      ),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButton(
                context: context,
                color: redColor,
                text: "Change your photo",
                textColor: whiteColor,
                onpress: () {
                  // calling image picker method
                  controller.changeImage(context);
                },
              ),
              const Divider(),
              20.heightBox,
              customTextFeild(
                hintText: nameHint,
                textfeildText: newName,
                controller: nameController,
                isPass: false,
              ),
              10.heightBox,
              customTextFeild(
                hintText: passwordHint,
                textfeildText: newPass,
                controller: passwordController,
                isPass: true,
              ),
              10.heightBox,
              SizedBox(
                width: context.screenWidth,
                child: customButton(
                  context: context,
                  color: redColor,
                  text: "Save",
                  textColor: whiteColor,
                  onpress: () {},
                ),
              ),
              10.heightBox,
            ],
          ).box.white.roundedSM.shadowSm.padding(const EdgeInsets.all(8)).make(),
        ),
      ),
    ));
  }
}
