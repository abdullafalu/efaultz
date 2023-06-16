import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/firebase_const.dart';
import 'package:e_faultz/constant/list.dart';
import 'package:e_faultz/controller/auth_controller.dart';
import 'package:e_faultz/controller/profile_controller.dart';
import 'package:e_faultz/services/firestore_services.dart';
import 'package:e_faultz/view/auth_screen.dart/login_screen.dart';
import 'package:e_faultz/view/profile_screen/details_card.dart';
import 'package:e_faultz/view/profile_screen/edit_profile_screen.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: StreamBuilder(
            stream: FirestoreServices.getUser(auth.currentUser!.uid),
            builder:
                ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];
                return Scaffold(
                  body: Column(
                    children: [
                      //edit section
                      5.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: whiteColor,
                            )).onTap(() {
                          //edit user profile screen
                          controller.nameController.text = data['name'];
                          controller.passController.text = data['password'];
                          Get.to(() => EditProfileScreen(
                                data: data,
                              ));
                        }),
                      ),
                      // first section,user details section/////
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(
                                    imgProfile2,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                                    data['imageUrl'],
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                            10.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data["name"]}"
                                      .text
                                      .white
                                      .size(18)
                                      .fontFamily(semibold)
                                      .make(),
                                  5.heightBox,
                                  "${data["email"]}"
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
                                onPressed: () async {
                                  // firebase user log out function
                                  await Get.put(AuthController())
                                      .signoutMethod(context);
                                  Get.offAll(() => LoginScreen());
                                },
                                child: "Log out"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make())
                          ],
                        ),
                      ),
                      0.heightBox,
                      //second section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              context: context,
                              count: data["cart_count"],
                              title: "In your cart",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              context: context,
                              count: data['wishlist_count'],
                              title: "In your wishlist",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              context: context,
                              count: data['order_count'],
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
                );
              }
            })));
  }
}
