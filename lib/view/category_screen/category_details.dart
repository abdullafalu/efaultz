import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/view/category_screen/items_details.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title.text.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // top button
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    6,
                    (index) {
                      return "Baby Clothing"
                          .text
                          .fontFamily(semibold)
                          .align(TextAlign.center)
                          .color(darkFontGrey)
                          .size(12)
                          .makeCentered()
                          .box
                          .white
                          .size(110, 60)
                          .rounded
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make();
                    },
                  ),
                ),
              ),
              20.heightBox,
              // second section start from here
              Expanded(
                child: Container(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 250),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          "Laptop 4GB/256GB"
                              .text
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          5.heightBox,
                          "\$250".text.color(redColor).fontFamily(bold).make(),
                        ],
                      )
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(10))
                          .outerShadowSm
                          .roundedSM
                          .make()
                          .onTap(() {
                            Get.to(()=>const ItemsDetails(title: "Dummy title"));
                          });
                    },
                  ),
                ),
              ),
              //third section start from here
            ],
          ),
        ),
      ),
    );
  }
}
