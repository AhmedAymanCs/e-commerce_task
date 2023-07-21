import 'package:flutter/material.dart';
import 'package:magd_task/data/data_providers/local/cache_helper.dart';
import 'package:magd_task/presentation/router/app_router.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class SignoutSScreen extends StatelessWidget {
  const SignoutSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: AppColor.white,
        child: TextButton(
          onPressed: () {
            CacheHelper.removeData(key: 'login').then((value) {
              CacheHelper.removeData(key: 'code').then((value)
              {
               Navigator.pushReplacementNamed(context, Routes.loginRoute);
              });
            });
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
