import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/list.dart';
import 'package:e_faultz/controller/auth_controller.dart';
import 'package:e_faultz/controller/profile_controller.dart';
import 'package:e_faultz/view/auth_screen.dart/login_screen.dart';
import 'package:e_faultz/view/profile_screen/details_card.dart';
import 'package:e_faultz/view/profile_screen/edit_profile_screen.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
 final controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    
    return bgWidget(
        child: Scaffold(
      body: Column(
        children: [
          //edit section
          25.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  size: 20,
                  color: whiteColor,
                )).onTap(() {
              //edit user profile screen
              Get.to(()=> EditProfileScreen());
            }),
          ),
          // first section,user details section/////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8),
            child: Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                5.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy user".text.white.fontFamily(semibold).make(),
                      5.heightBox,
                      "eFaultz234@gmail.com"
                          .text
                          .white
                          .fontFamily(semibold)
                          .make()
                    ],
                  ),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor)),
                    onPressed: ()async {
                      // firebase user log out function
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(()=> LoginScreen());
                    },
                    child: "Log out".text.white.fontFamily(semibold).make())
              ],
            ),
          ),
          5.heightBox,
          //second section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(
                  context: context,
                  count: "01",
                  title: "In your cart",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  context: context,
                  count: "49",
                  title: "In your wishlist",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  context: context,
                  count: "356",
                  title: "your orders",
                  width: context.screenWidth / 3.4),
            ],
          ),
          5.heightBox,
          // button section
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(
                color: lightGrey,
              );
            },
            itemCount: profileScreenButtonList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.asset(
                  profileScreenIconsList[index],
                  width: 22,
                ),
                title: profileScreenButtonList[index]
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
              );
            },
          )
              .box
              .white
              .rounded
              .margin(const EdgeInsets.all(12))
              .shadowSm
              .padding(const EdgeInsets.symmetric(horizontal: 16))
              .make()
              .box
              .color(redColor)
              .make(),
          //this is main column end
        ],
      ),
    ));
  }
}
