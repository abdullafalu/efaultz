import 'dart:io';

import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/controller/profile_controller.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:e_faultz/widget_common/custom_button.dart';
import 'package:e_faultz/widget_common/custom_textFeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.nameController.text=data['name'];
    // controller.passController.text=data['password'];

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // image url and controller path is empty
                data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    //if data is not empty and controller path is empty
                    : data['imageUrl'] != "" &&
                            controller.profileImagePath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          // else if image path is not empty
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
                  hintText: data["name"],
                  textfeildText: newName,
                  controller: controller.nameController,
                  isPass: false,
                ),
                10.heightBox,
                customTextFeild(
                  hintText: data['password'],
                  textfeildText: newPass,
                  controller: controller.passController,
                  isPass: false,
                ),
                10.heightBox,
                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor)),
                      )
                    : SizedBox(
                        width: context.screenWidth,
                        child: customButton(
                          context: context,
                          color: redColor,
                          text: "Save",
                          textColor: whiteColor,
                          onpress: () async {
                            // save user new data and images
                            controller.isLoading(true);
                            await controller.uploadProfileImage();
                            await controller.updateProfile(
                              imageUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.passController.text,
                            );
                            VxToast.show(context, msg: "Updated");
                          },
                        ),
                      ),
                10.heightBox,
              ],
            )
                .box
                .white
                .roundedSM
                .shadowSm
                .padding(const EdgeInsets.all(8))
                .make(),
          ),
        ),
      ),
    ));
  }
}
