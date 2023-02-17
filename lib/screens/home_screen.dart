// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last

import 'package:buymee/components/items_tile.dart';
import 'package:buymee/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 136, 84, 65),
      appBar: AppBar(
        title: Text(
          "BuyMee",
          style: GoogleFonts.sacramento(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_bag_outlined),
            iconSize: 35.0,
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: Width * 0.7,
              height: Height * 0.1,
              child: Text(
                "Let's Order\nSomething for you",
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ItemTiles(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onpress: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItemtoCart(index);
                    },
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
