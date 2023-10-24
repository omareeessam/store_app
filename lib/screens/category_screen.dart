import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_tha/cubit/cubit/app_cubit.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  late AppCubit appCubit;
  void initState() {
    appCubit = AppCubit.get(context);
    // TODO: implement initState
    super.initState();
    appCubit.getCategory();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (State is AppLoadinAllCategory) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AppSuccessAllCategory) {
          return Scaffold(
            backgroundColor: Colors.amber[100],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200)),
                          child: Image.network(
                            'https://www.shutterstock.com/image-photo/womans-jewelry-260nw-153354884.jpg',
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error_outline);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          appCubit.allCategory[1],
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://st.depositphotos.com/1000128/2454/i/450/depositphotos_24542943-stock-photo-mobile-devices-wireless-communication-technology.jpg',
                          height: 200,
                          width: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error_outline);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            appCubit.allCategory[0],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/864505242/photo/mens-clothing-and-personal-accessories.jpg?s=612x612&w=0&k=20&c=TaJuW3UY9IZMijRrj1IdJRwd6iWzXBlrZyQd1uyBzEY=',
                          height: 200,
                          width: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error_outline);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            appCubit.allCategory[2],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/1224554520/photo/womens-clothing-with-personal-accessories.jpg?s=612x612&w=0&k=20&c=VkC-3KONSxQtbZgGIijEJ5V6w4upSPKw5QFs9g1Je2Y=',
                          height: 200,
                          width: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error_outline);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            appCubit.allCategory[3],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Text('no state');
        }
      },
    );
  }
}
