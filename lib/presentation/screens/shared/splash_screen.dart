import 'dart:async';

import 'package:flutter/material.dart';

import 'package:magd_task/constants/image_manager.dart';
import 'package:magd_task/data/data_providers/local/cache_helper.dart';
import 'package:magd_task/presentation/router/app_router.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  //delay method
  _startDelay(bool login) {
    _timer = Timer(const Duration(seconds: 2), () {
      if(login)
        {
          Navigator.pushReplacementNamed(context, Routes.helpRoute);

        }
      else
        {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay(CacheHelper.getDataFromSharedPreference(key: 'login')??false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue100,
      body: Center(child: Image(image: AssetImage(ImageManager.splashImagePath))),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
