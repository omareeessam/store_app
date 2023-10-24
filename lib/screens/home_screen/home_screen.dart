import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:store_tha/cubit/cubit/app_cubit.dart';
import 'package:store_tha/remote/models/all_product_model.dart';
import 'package:store_tha/screens/home_screen/show_product.dart';
import 'package:store_tha/screens/updatescren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomePage';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppCubit ccubit;
  @override
  void initState() {
    super.initState();
    ccubit = AppCubit.get(context);
    ccubit.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          elevation: 0,
          title: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'new trend',
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 1000),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          backgroundColor: Colors.amber[100],
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
        body: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AppLoadin) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is AppSuccess) {
              return GridView.builder(
                itemCount: ccubit.myList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return buildItem(model: ccubit.myList[index]);
                },
              );
            } else {
              return const Text('no state');
            }
          },
        ));
  }

  Widget buildItem({required AllProductModel model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topEnd,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, UpdateScreen.id, arguments: model),
            onDoubleTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowProductScreen(allProductModel: model),
              ),
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      blurRadius: 40,
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 250,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        '${model.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(r'$' ' ${model.price!.toDouble()}',
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.blue)),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: () {
                                print(model.id);
                              },
                              icon: Icon(
                                size: 15,
                                color: Colors.white,
                                FontAwesomeIcons.heart,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Positioned(
            bottom: 110,
            right: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Image.network(
                '${model.image}',
                width: 70,
                height: 70,
                alignment: AlignmentDirectional.topEnd,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
