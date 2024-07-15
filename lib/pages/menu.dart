import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:piggytechfront/pages/selectedProduct.dart';
import 'package:piggytechfront/services/product.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/v1/product/all')     //Android
        // Uri.parse('http://127.0.0.1:8080/api/v1/product/all')     //Web
        // Uri.parse('http://---.---.---.---:8080/api/v1/product/all')     //IP Address of laptop
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val) {
          switch (val) {
            case 0:
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: products,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitRing(
                          color: Colors.black,
                          size: 60.0,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      List products = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.all(3.0),
                        child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(products[index].url),
                                ),
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
                                      '₱ ${products[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectedProduct(product: products[index]),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(
                      child: Text('Unable to load data'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}