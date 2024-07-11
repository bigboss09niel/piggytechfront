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
  late Future<List<Product>> products;

  Future<List<Product>> fetchData() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/v1/product/all'), // Android emulator
      //Uri.parse('http://127.0.0.1:8080/products'), // Web
      //Uri.parse('http://---.---.---.---:8080/products'), // IP Address of laptop
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Product> productsList = data.map((e) => Product.fromJson(e)).toList();
      return productsList;
    } else {
      throw Exception('Failed to load products');
    }
  }

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
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              Navigator.pushNamed(context, '/');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    List<Product> products = snapshot.data!;
                    return ListView.builder(
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
                                  '₱ ${products[index].price.toString()}0',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedProduct(product: products[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('Unable to load data'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:piggytechfront/pages/selectedProduct.dart';
// import 'package:piggytechfront/services/product.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class Menu extends StatefulWidget {
//   const Menu({Key? key}) : super(key: key);
//
//   @override
//   State<Menu> createState() => _MenuState();
// }
//
// class _MenuState extends State<Menu> {
//   late Future<List<Product>> products;
//
//   Future<List<Product>> fetchData() async {
//     final response = await http.get(
//       Uri.parse('http://10.0.2.2:8080/api/v1/product/all'), // Android emulator
//       //Uri.parse('http://127.0.0.1:8080/products'), // Web
//       //Uri.parse('http://---.---.---.---:8080/products'), // IP Address of laptop
//     );
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       List<Product> productsList = data.map((e) => Product.fromJson(e)).toList();
//       return productsList;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     products = fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white60,
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 3.0,
//         onTap: (int val) {
//           switch (val) {
//             case 0:
//               Navigator.pushNamed(context, '/dashboard');
//               break;
//             case 1:
//               Navigator.pushNamed(context, '/');
//               break;
//             case 2:
//               Navigator.pushNamed(context, '/profile');
//               break;
//           }
//         },
//         currentIndex: 1,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.smart_toy),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//               child: Text(
//                 'Dashboard',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: FutureBuilder<List<Product>>(
//                 future: products,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   } else if (snapshot.hasData) {
//                     List<Product> products = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(products[index].url),
//                             ),
//                             title: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   products[index].productName,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   '₱ ${products[index].price.toString()}0',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15.0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SelectedProduct(product: products[index]),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   } else {
//                     return Center(
//                       child: Text('Unable to load data'),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
