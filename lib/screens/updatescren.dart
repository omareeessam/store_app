import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_tha/remote/models/all_product_model.dart';
import 'package:store_tha/remote/requests/updateproduvt.dart';
import 'package:store_tha/screens/home_screen/custom_button.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({
    super.key,
  });
  static String id = 'updatescreen';

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName;

  String? descrpption;

  String? price;

  String? image;
  bool isLoaing = false;
  GlobalKey formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AllProductModel prodcct =
        ModalRoute.of(context)!.settings.arguments as AllProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoaing,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product !'),
        ),
        //  modal_progress_hud_nsn: ^0.4.0

        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      productName = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Product name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      descrpption = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'description',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      price = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'price',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      image = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'image',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButoon(
                    text: 'save product !',
                    onTap: () async {
                      isLoaing = true;

                      setState(() {});
                      try {
                        await updateProduct(prodcct);
                        print('success');
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                      backgroundColor: Colors.blue,        
                          content: Text("Updated succefely"),
                        ));
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoaing = false;

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(AllProductModel prodcct) async { 
    await UpdateProductServices().updateProduct(
      title: productName!,
      price: price.toString(),
      description: descrpption! ?? '',
      image: image!,
      category: prodcct.category! ?? '',
      id: prodcct.id!,
    );
  }
}
