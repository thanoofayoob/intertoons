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

  itemincrementordecrement(zxc.BestsellerProduct data, String action) {
    if (action == 'sub') {
      var recdata = cartdata!.productsList!
          .firstWhere((element) => element.id == data.id);

      recdata.orderCount = recdata.orderCount - 1;
      if (recdata.orderCount == 0) {
        cartdata!.productsList!.remove(data);
      }
      recdata.cartPrice = recdata.orderCount * recdata.price;
      double sum = 0;
      // ignore: unused_local_variable
      for (var item in cartdata!.productsList!) {
        sum += item.cartPrice!;
      }
      cartdata!.grandTotal = sum;

      update();
    } else {
      var recdata = cartdata!.productsList!
          .firstWhere((element) => element.id == data.id);

      recdata.orderCount = recdata.orderCount + 1;
      recdata.cartPrice = recdata.orderCount * recdata.price;
      double sum = 0;
      // ignore: unused_local_variable
      for (var item in cartdata!.productsList!) {
        sum += item.cartPrice!;
      }
      cartdata!.grandTotal = sum;
      update();
    }
  }

  addtocart(BuildContext context, zxc.BestsellerProduct? data) {
    // showcartmesssage(context);
    if (data!.itemaddedtoCart == false) {
      data.itemaddedtoCart = true;
      data.orderCount = 1;

      cartdata!.productsList!.add(data);
      double sum = 0;
      // ignore: unused_local_variable
      for (var item in cartdata!.productsList!) {
        sum += item.price!;
      }
      cartdata!.grandTotal = sum;

      showcartmesssage(context);
    } else {
      showerrormesssage(context);
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
      content: Text(
          '${cartdata!.productsList!.length} items in cart costs ${cartdata!.grandTotal}'),
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
