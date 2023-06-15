import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget customTextFeild({required String hintText,required String textfeildText,required controller,required bool isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textfeildText.text.color(redColor).fontFamily(semibold).make(),
      5.heightBox,
      TextFormField(
        obscureText:isPass,
        controller: controller,
        decoration:  InputDecoration(
          hintStyle:const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hintText,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
