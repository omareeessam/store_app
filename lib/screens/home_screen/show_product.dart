import 'package:flutter/material.dart';
import 'package:store_tha/remote/models/all_product_model.dart';

class ShowProductScreen extends StatelessWidget {
  ShowProductScreen({super.key, required this.allProductModel});
  static String id = 'Updatascreen';
  AllProductModel allProductModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    allProductModel.title.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    '${allProductModel.image}',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'price : ' + allProductModel.price.toString(),
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
