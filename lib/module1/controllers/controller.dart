// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intertoons/module1/models/cartmodel.dart';
import 'package:intertoons/module1/models/categorymodels.dart';
import 'package:intertoons/module1/models/homepagemodels.dart' as zxc;
import 'package:intertoons/module1/screens/cartpage.dart';
import 'package:intertoons/services/httpservices.dart';
import 'package:http/http.dart' as http;

class HomePageControler extends GetxController
    with SingleGetTickerProviderMixin {
  zxc.HomePage? homePagedata;
  Categories? catedata;
  bool homePageLoading = false;
  CartModel? cartdata = CartModel(
      id: 1,
      deliveryCharge: 0,
      grandTotal: 0,
      estimatedTax: 0,
      productsList: []);
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    getHomPageDeatils();
  }

  getHomPageDeatils() async {
    homePageLoading = true;
    update();
    http.Response? response = await HttpService().getApiwithHeader(
        url: 'http://fda.intertoons.com/api/V1/home',
        access: 'akhil@intertoons.com');
    http.Response? response2 = await HttpService().getApiwithHeader(
        url: 'http://fda.intertoons.com/api/V1/categories',
        access: 'akhil@intertoons.com');
    catedata = categoriesFromJson(response2!.body);
    homePagedata = zxc.homePageFromJson(response!.body);
    print(homePagedata!.message);
    homePageLoading = false;
    update();
  }

  addtocart(BuildContext context, zxc.BestsellerProduct? data) {
    showcartmesssage(context);
    for (var item in cartdata!.productsList!) {
      if (item.id == data!.id) {
        showerrormesssage(context);
      } else {
        cartdata!.productsList!.add(data);
        showcartmesssage(context);
      }
      update();
    }
  }

  showerrormesssage(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('item already in cart'),
      action: SnackBarAction(
        label: '  View Cart',
        textColor: Colors.white,
        onPressed: () {
          Get.to(const CartPAGE());
        },
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showcartmesssage(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('i items in cart costs :2229'),
      action: SnackBarAction(
        label: '  View Cart',
        textColor: Colors.white,
        onPressed: () {
          Get.to(const CartPAGE());
        },
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
