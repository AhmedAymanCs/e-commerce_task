// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magd_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magd_task/constants/image_manager.dart';
import 'package:magd_task/constants/string_manager.dart';
import 'package:magd_task/constants/values_manager.dart';
import 'package:magd_task/data/data_providers/local/cache_helper.dart';
import 'package:magd_task/data/network/requests/login_request.dart';
import 'package:magd_task/presentation/router/app_router.dart';
import 'package:magd_task/presentation/screens/shared/components.dart';
import 'package:magd_task/presentation/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          Fluttertoast.showToast(
              msg: LoginErrorState.errorToUser!, backgroundColor: Colors.red);
        }
        if (state is LoginSuccessState) {

          Fluttertoast.showToast(
              msg:state.code , backgroundColor: Colors.green);
          CacheHelper.saveDataSharedPreference(key: 'code', value: state.code).then((value)
          {
            CacheHelper.saveDataSharedPreference(key: 'login', value: true).then((value)
            {
              Navigator.pushReplacementNamed(context, Routes.otpRoute);
            });
          }
          );
        }

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.blue100,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              //background
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      )),
                ),
              ),

              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Login Block
                    Container(
                      margin: const EdgeInsets.all(AppMargin.m20),
                      padding: const EdgeInsets.all(AppPadding.p14),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 16)
                          ]),
                      child: _loginBlockOfData(state),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              image:
                                  AssetImage(ImageManager.rectangleImagePath)),
                          Text(
                            StringManager.or,
                            style: const TextStyle(color: AppColor.blue100),
                          ),
                          Image(
                              image:
                                  AssetImage(ImageManager.rectangleImagePath)),
                        ],
                      ),
                    ),

                    //another login method
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //facebook
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColor.white,
                            child: (Text(
                              'f',
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                        ),
                        // Icloud
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColor.white,
                            backgroundImage:
                                AssetImage(ImageManager.iosLogoImagePath),
                          ),
                        ),
                        //Gmail
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColor.white,
                            backgroundImage:
                                AssetImage(ImageManager.googleLogoImagePath),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _loginBlockOfData(state) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              StringManager.welcome,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Image(image: AssetImage(ImageManager.rectangleImagePath)),
          const SizedBox(
            height: AppPadding.p20,
          ),
          _defaultFormField(
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              label: StringManager.nameTextField,
              validate: (val) {
                if (val!.isEmpty) {
                  return 'Full name must be not empty';
                }
                return null;
              }),
          const SizedBox(
            height: AppSize.s17,
          ),
          _defaultFormField(
              controller: phoneController,
              textInputType: TextInputType.phone,
              label: StringManager.phoneTextField,
              validate: (val) {
                if (val!.isEmpty) {
                  return 'Phone Number must be not empty';
                }
                return null;
              }),
          const SizedBox(
            height: AppSize.s28,
          ),
          defaultButton(
            state,
            function: () {
//validate confirm
              if (formKey.currentState!.validate()) {
                GlobalCubit.get(context).sendLoginData(
                    LoginRequest(emailController.text, phoneController.text));
                GlobalCubit.get(context).phone=phoneController.text;
              }
            },
            name: StringManager.login,
          )
        ],
      ),
    );
  }

  Widget _defaultFormField({
    required String label,
    required String? validate(s),
    required TextEditingController controller,
    TextInputType? textInputType,
  }) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: label,
        ),
        validator: validate,
        controller: controller,
        keyboardType: textInputType,
      ),
    );
  }
}
