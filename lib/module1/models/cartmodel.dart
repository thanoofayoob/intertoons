import 'package:intertoons/module1/models/homepagemodels.dart';

class CartModel {
  CartModel(
      {this.id,
      this.subtotal,
      this.estimatedTax,
      this.deliveryCharge,
      this.grandTotal,
      this.productsList,
      l
      // this.addresses
      });

  int? id;
  double? subtotal;
  double? estimatedTax;
  double? deliveryCharge;
  double? grandTotal;
  List<BestsellerProduct>? productsList;
}

// class BestsellerProduct {
//   BestsellerProduct({
//     this.id,
//     this.name,
//     this.sku,
//     this.categoryId,
//     this.categoryName,
//     this.isVeg,
//     this.menuStatus,
//     this.description,
//     this.price,
//     this.specialPrice,
//     this.availableFrom,
//     this.availableTo,
//     this.image,
//     this.orderCount,
//   });

//   int? id;
//   String? name;
//   String? sku;
//   String? categoryId;
//   String? categoryName;
//   String? isVeg;
//   String? menuStatus;
//   String? description;
//   String? price;
//   dynamic specialPrice;
//   String? availableFrom;
//   String? availableTo;
//   String? image;
//   int? orderCount;
// }
