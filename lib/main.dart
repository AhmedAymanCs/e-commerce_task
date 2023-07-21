
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magd_task/business_logic/bloc_observer.dart';
import 'package:magd_task/data/data_providers/local/cache_helper.dart';
import 'package:magd_task/data/data_providers/remote/dio_helper.dart';
import 'package:magd_task/presentation/router/app_router.dart';

import 'business_logic/global_cubit/global_cubit.dart';
import 'presentation/styles/colors.dart';


late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

      runApp(MyApp(
        appRouter: AppRouter(),
      ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()..getHelpData()
          ),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: Routes.splashRoute,
            theme: ThemeData(
                fontFamily: 'cairo',
                appBarTheme:  AppBarTheme(
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                textTheme: TextTheme(
                  titleLarge: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  titleMedium: TextStyle(
                    color: AppColor.blue100,
                    fontSize: 20
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 20
                  )
                ),
                primaryColor: AppColor.blue100
            ),
          );
        },
      ),
    );
  }
}