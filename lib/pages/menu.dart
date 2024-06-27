import 'package:flutter/material.dart';
import 'package:piggytechfront/services/product.dart';
import 'package:piggytechfront/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "IT1", price: 10.0),
    Product(productName: "IT2", price: 20.0),
    Product(productName: "IT3", price: 30.0),
    Product(productName: "IT4", price: 40.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) =>
          Menucard(product: product)).toList(),
        ),
      ),
    );
  }
}
