import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({context,required String count,required String title,width}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count.text.color(darkFontGrey).size(18).fontFamily(bold).make(),
      5.heightBox,
      title.text.color(darkFontGrey).fontFamily(semibold).make()
    ],
  )
      .box
      .white
      .width(width)
      .roundedSM
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}
