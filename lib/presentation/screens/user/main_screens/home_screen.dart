import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/constants/image_manager.dart';
import 'package:magd_task/constants/string_manager.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/presentation/screens/shared/components.dart';
import 'package:magd_task/presentation/styles/colors.dart';
import 'package:magd_task/presentation/view/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: defaultContainer(
                    blurRadius: 30,
                    spreadRadius: 3,
                    redius: 10,
                    height: 50,
                    width: 320,
                    margin: const EdgeInsets.all(AppMargin.m12),
                    padding: const EdgeInsets.all(AppPadding.p8),
                    color: AppColor.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringManager.search),
                        const Icon(Icons.search)
                      ],
                    )),
              ),
              defaultContainer(
                margin: const EdgeInsets.all(AppMargin.m16),
                blurRadius: 30,
                spreadRadius: 3,
                redius: 15,
                width: 50,
                height: 50,
                color: AppColor.white,
                child: Image.asset(ImageManager.vectorImagePath),
              )
            ],
          ),
          //banner
          defaultContainer(
              blurRadius: 30,
              spreadRadius: 3,
              redius: 25,
              margin: const EdgeInsets.all(AppMargin.m10),
              child: CarouselSlider(
                items: [
                  Image.asset(ImageManager.acer1ImagePath),
                  Image.asset(ImageManager.acer2ImagePath),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1,
                ),
              )),
          //products
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            clipBehavior: Clip.hardEdge,
            //childAspectRatio: 1/1.58,
            children: List.generate(
                GlobalCubit.get(context).productResponse!.products.length,
                (index) => productCard(context,
                    GlobalCubit.get(context).productResponse!.products[index])),
          ),
        ],
      ),
    );
  }

  Widget _gridViewOfProduct() {
    return GridView.count(
      crossAxisCount: 1,
      children: [],
    );
  }
}
