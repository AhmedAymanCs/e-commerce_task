import 'package:flutter/material.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/presentation/styles/colors.dart';

Widget defaultButton(state ,{
 required VoidCallback function,
  required String name
})
{
return Container(
width: double.infinity,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30),
gradient: const LinearGradient(
colors: [
AppColor.blue100,
AppColor.blue50,
AppColor.blue27,
],
)),

//login button
child: state is LoadingState ? const Center(
child: CircularProgressIndicator(
),
): TextButton(
onPressed: function,
child: Text(
  name,
style: const TextStyle(color: Colors.white),
),
),
);
}


Widget defaultContainer(
    {
      Widget? child,
      double? height,
      double? width,
      Color? color,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      required double blurRadius,
      required double spreadRadius,
      required double redius}) {
  return Container(
    height: height,
    width: width,
    child: child,
    margin: margin,
    padding: padding,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: const Offset(0, 0),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        )
      ],
      borderRadius: BorderRadius.circular(redius),
    ),
  );
}