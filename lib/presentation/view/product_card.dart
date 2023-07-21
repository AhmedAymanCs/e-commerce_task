import 'package:flutter/material.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/data/network/responses/product_response.dart';
import 'package:magd_task/presentation/screens/shared/product_info.dart';
import 'package:magd_task/presentation/styles/colors.dart';

Widget productCard(context,ProductInfoResponse data) {

  return InkWell(
    onTap: ()
    {
  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductInfo(productInfo: data)));
    },
    child: Card(
      elevation: 30,
      borderOnForeground: true,
      child: Container(
        height:240 ,
        width: 170,
        //padding: EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s28)
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Expanded(
                          child: Image(
                              image: NetworkImage(data.image!??'https://assets.razerzone.com/eeimages/support/products/1475/blade-stealth-13-2019-2.png'),

                          ),
                        ),
                    Text(data.company!??'',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.blue100,
                      fontWeight: FontWeight.normal,
                      fontSize: 25
                    ),),
                    Text(data.name!??'',
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s16,
                    ),
                    Text(
                        data.price!??'',
                      style: TextStyle(
                        fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                height: AppSize.s40,
                width: AppSize.s40,
                decoration: BoxDecoration(
                  color: AppColor.blue100,
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      AppColor.blue100,
                      AppColor.blue50,
                      AppColor.blue27,
                    ]
                ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s28),
                  ),
                ),
                child: Icon(Icons.add,
                  color: AppColor.white,
                  size: AppSize.s16,
              ),
            ),),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                    Icons.favorite,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}