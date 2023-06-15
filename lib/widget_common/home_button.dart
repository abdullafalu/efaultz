import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget homeButton({
  required String title,
  required String icon,
  required double sizeWidth,
  required double sizeHeight,
  
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 25,),
      5.heightBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.rounded.white.size(sizeWidth, sizeHeight).shadowSm.make();
}
