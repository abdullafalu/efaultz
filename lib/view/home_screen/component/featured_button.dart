import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({required String title, required String images,}) {
  return Row(
    children: [
      Image.asset(
        images,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .outerShadowSm
      .make();
}
