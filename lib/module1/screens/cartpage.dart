import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/module1/controllers/controller.dart';
import 'package:intertoons/module1/screens/hompage.dart';

class CartPAGE extends StatelessWidget {
  const CartPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControler>(builder: (_ctr) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summaary',
                  style: headerStyle(),
                ),
                const TextField(
                  scrollPadding: EdgeInsets.zero,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                      hintText: 'Note ,eg add some sauce',
                      fillColor: Colors.white70),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: _ctr.cartdata!.productsList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 2.5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(_ctr.cartdata!.productsList![index].name!)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            _ctr.itemincrementordecrement(
                                                _ctr.cartdata!
                                                    .productsList![index],
                                                'sub');
                                          },
                                          // ignore: prefer_const_constructors
                                          icon: Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Center(
                                      child: Text(_ctr.cartdata!
                                          .productsList![index].orderCount
                                          .toString()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: IconButton(
                                        onPressed: () {
                                          _ctr.itemincrementordecrement(
                                              _ctr.cartdata!
                                                  .productsList![index],
                                              'add');
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                  width: 35,
                                ),
                                Text(
                                  _ctr.cartdata!.productsList![index].cartPrice!
                                      .toString(),
                                  style: specialpricestyle(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  // ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item Total',
                      style: subheadStyle().copyWith(fontSize: 20),
                    ),
                    Text(
                      _ctr.cartdata!.grandTotal.toString(),
                      style: subheadStyle().copyWith(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: headerStyle().copyWith(fontSize: 20),
                    ),
                    Text(
                      _ctr.cartdata!.grandTotal.toString(),
                      style: headerStyle().copyWith(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),

                Text(
                  'Adrress',
                  style: headerStyle().copyWith(fontSize: 22),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'test testst etst et s stst st st sststs st s sshskxjsx sughx ksxjsxlkj xhxxjls xsk',
                        style: subheadStyle().copyWith(fontSize: 14),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: specialpricestyle(),
                        ))
                  ],
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      'Procceed to Payment',
                      style: headerStyle()
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
