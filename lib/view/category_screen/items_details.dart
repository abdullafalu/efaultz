import 'package:e_faultz/constant/consts.dart';
import 'package:e_faultz/constant/list.dart';
import 'package:e_faultz/widget_common/custom_button.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightGrey,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: title.text.color(darkFontGrey).size(18).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //use swiper widget
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 300,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    // product details sections
                    title.text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    5.heightBox,
                    // vx rating stars
                    VxRating(
                      onRatingUpdate: (value) {},
                      count: 5,
                      size: 20,
                      stepInt: true,
                      selectionColor: golden,
                    ),
                    10.heightBox,
                    "\$35.00"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller"
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .make(),
                            "In House Brands"
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(lightGrey)
                        .make(),
                    20.heightBox,

                    //color section
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            //randow color circle avatar
                            Row(
                              children: List.generate(
                                3,
                                (index) {
                                  return VxBox()
                                      .size(30, 30)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make();
                                },
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            //randow color circle avatar
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                "0 available"
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make()
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            "\$10.00"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .make()
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),
                    10.heightBox,
                    //description section
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .size(16)
                        .fontFamily(bold)
                        .make(),
                    6.heightBox,
                    "This is a dummy item and dummy details of product\n-100% cotton\n-100% cotton\n-100% cotton\n-100% cotton"
                        .text
                        .fontFamily(semibold)
                        .make(),
                    //list view section
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailsButtonNameList.length,
                        (index) {
                          return ListTile(
                            title: itemDetailsButtonNameList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: darkFontGrey,
                            ),
                          );
                        },
                      ),
                    ),
                    20.heightBox,
                    // products you may like section
                    productsYouMayLike.text.color(darkFontGrey).fontFamily(bold).make(),
                    10.heightBox,
                    // i copied this whole widget from home screen
                    SingleChildScrollView(
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
            ),
          ),
          SizedBox(
            width: context.screenWidth,
            height: 60,
            child: customButton(
              context: context,
              color: redColor,
              text: addToCart,
              textColor: darkFontGrey,
              onpress: () {},
            ),
          )
        ],
      ),
    );
  }
}
