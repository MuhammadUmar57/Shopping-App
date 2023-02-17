// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    [
      "Iphone 14 Pro Max",
      "1500.00",
      "https://ss7.vzw.com/is/image/VerizonWireless/iphone-14-pro-max-deep-purple-fall22-a?\$device-lg\$",
      Colors.green
    ],
    [
      "Iphone 13 Pro Max",
      "1350.00",
      "https://cdn.tmobile.com/images/png/products/phones/Apple-iPhone-13-Pro-Gold/250x270_1.png",
      Colors.blue
    ],
    [
      "Iphone 12        ",
      "900.00",
      "https://www.att.com/idpassets/global/devices/phones/apple/apple-iphone-12/carousel/blue/64gb/6861C-1_carousel.png",
      Colors.red
    ],
    [
      "Iphone XS Max    ",
      "1000.00",
      "https://cdn.shopify.com/s/files/1/0290/4064/0078/products/xsmaxgold.png?v=1662660177",
      Colors.brown
    ],
    [
      "Iphone 14 Pro Max",
      "1500.00",
      "https://ss7.vzw.com/is/image/VerizonWireless/iphone-14-pro-max-deep-purple-fall22-a?\$device-lg\$",
      Colors.purple
    ],
    [
      "Iphone 13 Pro Max",
      "1350.00",
      "https://cdn.tmobile.com/images/png/products/phones/Apple-iPhone-13-Pro-Gold/250x270_1.png",
      Colors.yellow
    ],
    [
      "Iphone 12        ",
      "900.00",
      "https://www.att.com/idpassets/global/devices/phones/apple/apple-iphone-12/carousel/blue/64gb/6861C-1_carousel.png",
      Colors.blueGrey
    ],
    [
      "Iphone XS Max    ",
      "1000.00",
      "https://cdn.shopify.com/s/files/1/0290/4064/0078/products/xsmaxgold.png?v=1662660177",
      Colors.pink
    ]
  ];

  get shopItems => _shopItems;
  get cartItems => _cartItems;
  List _cartItems = [];

  void addItemtoCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String Total() {
    double totalprice = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      totalprice += double.parse(_cartItems[i][1]);
    }

    return totalprice.toStringAsFixed(2);
  }
}
