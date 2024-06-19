import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('PiggyTech Front'),
        ),
        backgroundColor: Colors.blueAccent[100],
      ),
      body: Center(
        child: Image.network('https://en.gundam.info/about-gundam/series-pages/seedfreedom/gseedfreedom/en/product/2023/10/hg_rising_freedom_gundam_01m_en_1.jpg')
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.blueAccent[100],
      ),
    ),
  ));
}
