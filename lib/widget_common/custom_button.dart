import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required BuildContext context,
  required Color color,
  required String text,
  required Color textColor,
  required void Function()? onpress,
}) {
  return InkWell(
    onTap: onpress,
    child: Container(
      width: (context.screenWidth - 110),
      height: 35,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Center(
        child: text.text.color(textColor).fontFamily(bold).make(),
      ),
    ),
  );
}
