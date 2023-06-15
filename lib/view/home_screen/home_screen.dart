import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/list.dart';
import 'package:e_faultz/view/home_screen/component/featured_button.dart';
import 'package:flutter/material.dart';

import '../../widget_common/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: context.screenWidth,
      // height: context.screenHeight,
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: searchEnything,
                  filled: true,
                  fillColor: whiteColor,
                  hintStyle: TextStyle(color: textfieldGrey),
                  suffixIcon: Icon(
                    Icons.search,
                    color: redColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //swiper show images
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.all(8))
                            .make();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) {
                        return homeButton(
                          title: index == 0 ? todayDeal : flashSale,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          sizeWidth: context.screenWidth / 2.5,
                          sizeHeight: context.screenHeight * 0.15,
                        );
                      }),
                    ),
                    // 10.heightBox,
                    //second swiper
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.all(8))
                            .make();
                      },
                    ),
                    // 10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) {
                          return homeButton(
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brands
                                    : topSellers,
                            icon: index == 0
                                ? icCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            sizeWidth: context.screenWidth / 3.5,
                            sizeHeight: context.screenHeight * 0.15,
                          );
                        },
                      ),
                    ),
                    10.heightBox,
                    // features categories
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .size(18)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) {
                            return Column(
                              children: [
                                featuredButton(
                                  images: featuredImage1[index],
                                  title: featuredTitle1[index],
                                ),
                                10.heightBox,
                                featuredButton(
                                  images: featuredImage2[index],
                                  title: featuredTitle2[index],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    20.heightBox,
                    //featured product section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featurdProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(6, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "Laptop 4GB/256GB"
                                      .text
                                      .color(darkFontGrey)
                                      .fontFamily(semibold)
                                      .make(),
                                  5.heightBox,
                                  "\$250"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              )
                                  .box
                                  .white
                                  .roundedSM
                                  .padding(const EdgeInsets.all(8))
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 3))
                                  .make();
                            })),
                          )
                        ],
                      ),
                    ),
                    // third swiper section
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.all(8))
                            .make();
                      },
                    ),
                    // last product section
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300 ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                  Image.asset(
                                    imgP5,
                                    height: 200,
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
                                  "\$250"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                        ).box.white.roundedSM.padding(const EdgeInsets.all(10)).make();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
