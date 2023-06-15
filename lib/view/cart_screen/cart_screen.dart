import 'package:e_faultz/constant/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(
          child: "Cart is empty!"
              .text
              .color(darkFontGrey)
              .fontFamily(bold)
              .size(18)
              .make()),
    );
  }
}
