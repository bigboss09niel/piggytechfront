import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piggytechfront/pages/selectedProduct.dart';
import 'package:piggytechfront/services/product.dart';
import 'package:piggytechfront/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // All PRODUCT
  late Future<List<dynamic>> products;
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/v1/product/all')     //Android
        //Uri.parse('http://127.0.0.1:8080/products')     //Web
        //Uri.parse('http://---.---.---.---:8080/products')     //IP Address of laptop
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    return products;
  }

  //SOLO PRODUCT
  //Future<Product> fetchSingle() async{
  //  final response = await http.get(
  //    Uri.parse('http://10.0.2.2:8080/product/5')
  //  );
  //  final data = jsonDecode(response.body);
  //  Product newProduct = Product.fromJson(data);
  //  return newProduct;
  //}

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }

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
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshots){
            if(snapshots.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitRing(
                  color: Colors.black,
                  size: 60.0,
                ),
              );
            }
            if(snapshots.hasData){
              List products = snapshots.data!;
              return Padding(
                padding:  EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].productName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              products[index].price.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => SelectedProduct(product: products[index]),
                            ),
                          );
                        },
                      ),
                    );
                  }
                ),
              );
            }
            return Center(
              child: Text('Unable to load data'),
            );
          },
        ),
      ),
    );
  }
}
