import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/data/network/responses/product_response.dart';

import 'package:magd_task/presentation/screens/shared/components.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class ProductInfo extends StatefulWidget {
  final ProductInfoResponse productInfo;
    const ProductInfo( {super.key,required this.productInfo}) ;
  @override
  State<ProductInfo> createState() => _ProductInfoState(productInfo);
}

class _ProductInfoState extends State<ProductInfo> {
  final ProductInfoResponse _productInfo;

  _ProductInfoState(this._productInfo);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.blue27.withOpacity(0.9),
                AppColor.white,
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p28),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultContainer(
                    blurRadius: 30, spreadRadius: 3, redius: 10,
                 // margin: EdgeInsets.all(AppMargin.m20),
                  color: AppColor.white,
                  height: AppSize.s40,
                  width: AppSize.s40,
                  child: Icon(
                      Icons.arrow_back_ios,
                    color: Colors.grey,
                  )
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Text(_productInfo.name!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.white
                ),
                ),
                Text('Type: ${_productInfo.type!}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.white
                ),
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Center(
                  child: defaultContainer(
                      blurRadius: 10, spreadRadius: 3, redius: 10,
                      // margin: EdgeInsets.all(AppMargin.m20),
                      color: AppColor.white,
                      height: 300,
                      width: 350,
                      child: Image(image: NetworkImage(_productInfo.image!)),
                  ),
                ),
                SizedBox(
                  height: AppSize.s40,
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.black45,

                          ),
                        ),
                        Text(
                          ' ${_productInfo.price!} EGP',
                          style: TextStyle(

                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: AppSize.s190,
                      height: AppSize.s40,
                      child: defaultButton(
                          state,
                          function: (){},
                          name: 'Add To Cart',
                      ),
                    )
                  ],
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  margin: EdgeInsets.all(AppMargin.m20),
                  color: Colors.grey,
                ),
                Column(
                  children: const[
                    Text('OverView'),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColor.blue100,
                      radius: 5,
                    ),
                  ],
                ),
                Text(_productInfo.description!)
              ],
            ),
          ),
        ),
      ),
      ),
    );
  },
);
  }
}
