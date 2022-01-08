// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/module1/components/imagewidget.dart';
import 'package:intertoons/module1/controllers/controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControler(), permanent: true);
    return GetBuilder<HomePageControler>(
        init: HomePageControler(),
        builder: (_ctr) {
          return SafeArea(
            child: Scaffold(
              body: _ctr.homePageLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('Deliver to', style: headerStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Akhil niagras glen nature  centre niagra ',
                                style: subheadStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: Get.height * .35,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,

                                physics: const BouncingScrollPhysics(),
                                itemCount: _ctr
                                    .homePagedata!.data!.sliderBanners!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 2.5,
                                          bottom: 5),
                                      child: Column(
                                        children: [
                                          ImageWidget(
                                            height: Get.height * .29,
                                            radius: 12,
                                            width: Get.width * .75,
                                            url: _ctr
                                                .homePagedata!
                                                .data!
                                                .sliderBanners![index]
                                                .bannerImg!,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                // ),
                              ),
                            ),
                            Text('Explore menu', style: headerStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: Get.height * .15,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,

                                physics: const BouncingScrollPhysics(),
                                itemCount: _ctr.catedata!.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 2.5,
                                          bottom: 5),
                                      child: Column(
                                        children: [
                                          ImageWidget(
                                            height: Get.height * .1,
                                            radius: 5,
                                            width: Get.width * .2,
                                            url: _ctr
                                                .catedata!.data![index].catImg!,
                                          ),
                                          Text(_ctr
                                              .catedata!.data![index].catName!)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                // ),
                              ),
                            ),
                            Text('Featured', style: headerStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: Get.height * .20,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,

                                physics: const BouncingScrollPhysics(),
                                itemCount: _ctr.homePagedata!.data!
                                    .featuredProducts!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 2.5,
                                          bottom: 5),
                                      child: Container(
                                        height: Get.height * .2,
                                        width: Get.width * .65,
                                        // color: Colors.transparent,
                                        decoration: BoxDecoration(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            boxShadow: [
                                              const BoxShadow(
                                                  color: Colors.white,
                                                  spreadRadius: 3)
                                            ],
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.1)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0))),
                                        child: Column(
                                          children: [
                                            ImageWidget(
                                              height: Get.height * .10,
                                              radius: 8,
                                              width: Get.width * .65,
                                              url: _ctr
                                                  .homePagedata!
                                                  .data!
                                                  .featuredProducts![index]
                                                  .image!,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(_ctr
                                                      .homePagedata!
                                                      .data!
                                                      .featuredProducts![index]
                                                      .name!)
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'ADD',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.red),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    _ctr
                                                        .homePagedata!
                                                        .data!
                                                        .featuredProducts![
                                                            index]
                                                        .specialPrice!
                                                        .toString(),
                                                    style: specialpricestyle(),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    _ctr
                                                        .homePagedata!
                                                        .data!
                                                        .featuredProducts![
                                                            index]
                                                        .price!,
                                                    style: pricecutdetails(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                                // ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),

                              itemCount: _ctr.homePagedata!.data!
                                  .additionalBanners!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 2.5, bottom: 5),
                                    child: Column(
                                      children: [
                                        ImageWidget(
                                          height: Get.height * .19,
                                          radius: 12,
                                          fit: BoxFit.fill,
                                          width: Get.width,
                                          url: _ctr
                                              .homePagedata!
                                              .data!
                                              .additionalBanners![index]
                                              .bannerImg!,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              // ),
                            ),
                            Text('BestSeller', style: headerStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(bottom: 5),

                              itemCount: _ctr.homePagedata!.data!
                                  .bestsellerProducts!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ImageWidget(
                                        height: 100,
                                        radius: 12,
                                        fit: BoxFit.cover,
                                        width: 100,
                                        url: _ctr.homePagedata!.data!
                                            .bestsellerProducts![index].image!,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              myWidget(),
                                              Text(
                                                _ctr
                                                    .homePagedata!
                                                    .data!
                                                    .bestsellerProducts![index]
                                                    .name!,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              AddToCartWidget(
                                                onPressd: () {
                                                  _ctr.addtocart(
                                                      context,
                                                      _ctr.homePagedata!.data!
                                                              .bestsellerProducts![
                                                          index]);
                                                },
                                              ),
                                              Text(
                                                _ctr
                                                    .homePagedata!
                                                    .data!
                                                    .bestsellerProducts![index]
                                                    .specialPrice!
                                                    .toString(),
                                                style: specialpricestyle(),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                _ctr
                                                    .homePagedata!
                                                    .data!
                                                    .bestsellerProducts![index]
                                                    .price!
                                                    .toString(),
                                                style: pricecutdetails(),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        });
  }
}

class AddToCartWidget extends StatelessWidget {
  Function() onPressd;
  AddToCartWidget({Key? key, required this.onPressd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressd,
        child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'ADD',
              style: TextStyle(fontSize: 10, color: Colors.white),
            )));
  }
}

TextStyle headerStyle() {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle subheadStyle() {
  return const TextStyle(fontSize: 10, fontWeight: FontWeight.w200);
}

TextStyle pricecutdetails() {
  return TextStyle(
      decoration: TextDecoration.lineThrough,
      fontSize: 12,
      color: Colors.black.withOpacity(.2));
}

TextStyle specialpricestyle() {
  return const TextStyle(fontSize: 16, color: Colors.red);
}

Widget myWidget() {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(5.0),
    decoration: myBoxDecoration(), //       <--- BoxDecoration here
    child: const CircleAvatar(
      backgroundColor: Colors.green,
      radius: 4,
    ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.green, //                   <--- border color
      width: 2.0,
    ),
  );
}
