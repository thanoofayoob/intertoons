// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/module1/components/customtabview.dart';
import 'package:intertoons/module1/components/imagewidget.dart';
import 'package:intertoons/module1/controllers/controller.dart';
import 'package:intertoons/module1/models/categorymodels.dart';
import 'package:intertoons/module1/screens/hompage.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);
  List<String> data = ['Page 0', 'Page 1', 'Page 2'];
  int initPosition = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomePageControler>(builder: (_ctr) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Explore Menu',
              style: headerStyle(),
            ),
          ),
          body: SafeArea(
            child: CustomTabView(
              initPosition: initPosition,
              itemCount: _ctr.catedata!.data!.length,
              tabBuilder: (context, index) =>
                  Tab(text: _ctr.catedata!.data![index].catName),
              pageBuilder: (context, index) => Categorywise(
                index: index,
                data: _ctr.catedata!.data![index],
              ),
              onPositionChange: (index) {
                // print('current position: $index');
                initPosition = index;
              },
              onScroll: (position) => {},
            ),
          ),
        );
      }),
    );
  }
}

class Categorywise extends StatelessWidget {
  int? index;
  Datum? data;
  Categorywise({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: data!.childData!.isEmpty
          ? const Center(child: Icon(Icons.no_food))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data!.childData!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: Get.height * .35,
                  // width: Get.width * .65,

                  decoration: BoxDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(color: Colors.white, spreadRadius: 3)
                      ],
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    children: [
                      ImageWidget(
                          height: Get.height * .22,
                          radius: 8,
                          width: Get.width,
                          url: data!.catImg!),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [myWidget(), Text(data!.catName!)],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data!.catId.toString(),
                              style: specialpricestyle(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
