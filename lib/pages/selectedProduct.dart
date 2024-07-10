import 'package:flutter/material.dart';
import 'package:piggytechfront/services/product.dart';

class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;

  _SelectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [

              Container(
                width: 400,
                height: 400,
                child: Image.network(product.url), //Network
                // Image.asset(product.url), //Local
              ),
              Text(
                widget.product.productName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.product.description,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if(numberOfOrders > 1){
                            numberOfOrders -= 1;
                            totalAmount = product.price * numberOfOrders;
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      numberOfOrders.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          numberOfOrders += 1;
                          totalAmount = product.price * numberOfOrders;
                        });
                      },
                      icon: Icon(Icons.add)
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
