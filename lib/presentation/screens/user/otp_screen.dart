import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/constants/string_manager.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/data/network/requests/otp_request.dart';
import 'package:magd_task/presentation/router/app_router.dart';
import 'package:magd_task/presentation/screens/shared/components.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var fromKey=GlobalKey<FormState>();
  final focus = FocusNode();
  var codeController1 = TextEditingController();
  var codeController2 = TextEditingController();
  var codeController3 = TextEditingController();
  var codeController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is OTPErrorState) {
          Fluttertoast.showToast(
              msg: OTPErrorState.errorToUser!, backgroundColor: Colors.red);
        }
        if (state is OTPSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.helpRoute);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.blue27.withOpacity(0.9),
                AppColor.white,

              ]
            )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Form(
                key: fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.verifyPhone,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.normal, color: AppColor.white),
                    ),
                    SizedBox(
                      height: AppSize.s100,
                    ),
                    _groupOFBlockOfCodeNum(),
                    SizedBox(
                      height: AppSize.s90,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(StringManager.resendCode),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p28),
                      child: defaultButton(state,
                          function: ()
                          {
                            if(fromKey.currentState!.validate())
                              {
                               GlobalCubit.get(context).sendOTPData(OTPRequest(_groupCode(), GlobalCubit.get(context).phone!));
                              }
                          }, name: StringManager.verify),
                    ),
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }

  //group of block
  Widget _groupOFBlockOfCodeNum() {
    return Row(
      children: [
        //first num
        _blockOFCodeNum(codeController1),
        //second num
        _blockOFCodeNum(codeController2),
        //third num
        _blockOFCodeNum(codeController3),
        //fourth num
        _blockOFCodeNum(codeController4),
      ],
    );
  }

  //one block
  Widget _blockOFCodeNum(controller) {
    return Expanded(
      child: Container(
        height: 70,
        width: 80,
        margin: EdgeInsets.all(AppSize.s18),
        padding: EdgeInsets.all(AppPadding.p20),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(AppSize.s20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 10,
                offset: Offset(0, 0),
                blurRadius: 5
              ),
            ]),
        child: Center(
          child: TextFormField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 30
            ),
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }

  String _groupCode ()
  {
    return codeController1.text+codeController2.text+codeController3.text+codeController4.text;
  }
}
