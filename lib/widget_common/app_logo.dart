import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

Widget appLogo() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
