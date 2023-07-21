import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:magd_task/presentation/screens/user/main_screens/favorite_screen.dart';
import 'package:magd_task/presentation/screens/user/main_screens/home_screen.dart';
import 'package:magd_task/presentation/screens/user/main_screens/notification_screen.dart';
import 'package:magd_task/presentation/screens/user/main_screens/setting_screen.dart';
import 'package:magd_task/presentation/screens/user/main_screens/singout_screen.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
   int currentIndex = 2;
   List<Widget> screens=[
     const SignoutSScreen(),
     const FavoriteScreen(),
     const HomeScreen(),
     const NotificationScreen(),
     const SettingScreen(),
   ];
  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            onTap: (index)
              {
                setState(() {
                  currentIndex=index;
                });
              },
              index: currentIndex,
              items: const [
                Icon(Icons.account_balance_wallet_outlined),
                Icon(Icons.favorite),
                Icon(Icons.home),
                Icon(Icons.notification_add_rounded),
                Icon(Icons.settings),
              ],
              buttonBackgroundColor: AppColor.blue100,
              color: AppColor.blue100,
            backgroundColor:AppColor.white ,
            ),
        ),
        body: SafeArea(
          child:screens[currentIndex],
        ),
      ),
    );
  }
}
