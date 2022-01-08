import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/module1/screens/hompage.dart';

class CartPAGE extends StatelessWidget {
  const CartPAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [Text('Butter Chicken Frankie')],
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
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
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
                          const Center(
                            child: Text(
                              '22',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: IconButton(
                              onPressed: () {},
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
                        '333.44',
                        style: specialpricestyle(),
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
                        'Item Total',
                        style: subheadStyle().copyWith(fontSize: 20),
                      ),
                      Text(
                        '2222.33',
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
                        '2222.33',
                        style: headerStyle().copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
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
                    borderRadius: BorderRadius.circular(8), color: Colors.red),
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
  }
}
