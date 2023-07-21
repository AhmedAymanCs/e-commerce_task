import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/constants/string_manager.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/data/network/responses/help_response.dart';
import 'package:magd_task/presentation/router/app_router.dart';
import 'package:magd_task/presentation/screens/shared/components.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    GlobalCubit cubit = BlocProvider.of(context);
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
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.help,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColor.white,
                            fontWeight: FontWeight.normal),
                      ),
                      //content components
                      Column(
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => helpContent(
                                  cubit.helpResponse!.help[index],
                                  context,
                                  index),
                              separatorBuilder: (context, index) => const SizedBox(
                                    height: AppSize.s8,
                                  ),
                              itemCount: cubit.helpResponse!.help.length),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultButton(state, function: () {
                          GlobalCubit.get(context).getProduct().then((value) {
                            Navigator.pushReplacementNamed(
                                context, Routes.layoutRoute);
                          });

                          ;
                        }, name: StringManager.continueString),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }

  Widget helpContent(HelpDataResponse data, context, index) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black45.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 0),
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.question!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      GlobalCubit.get(context).changeShowState(index);
                    });
                  },
                  icon: GlobalCubit.get(context).isShow[index]
                      ? const Icon(
                          Icons.arrow_drop_up,
                          color: AppColor.blue100,
                          size: AppSize.s28,
                        )
                      : const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: AppColor.blue100,
                          size: AppSize.s28,
                        )),
            ],
          ),
          if (GlobalCubit.get(context).isShow[index])
            Text(
              data.answer!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
