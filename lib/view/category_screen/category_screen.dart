import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/list.dart';
import 'package:e_faultz/view/category_screen/category_details.dart';
import 'package:e_faultz/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: catagories.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImageList[index],
                    height: 120,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoryTitleList[index].text.align(TextAlign.center).fontFamily(semibold).make()
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                Get.to(()=>CategoryDetails(title: categoryTitleList[index]));
              });
            }),
      ),
    ));
  }
}
