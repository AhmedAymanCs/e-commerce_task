// ignore_for_file: unrelated_type_equality_checks

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magd_task/data/data_providers/remote/dio_helper.dart';
import 'package:magd_task/data/mapper/mapper.dart';
import 'package:magd_task/data/models/account_model.dart';
import 'package:magd_task/data/network/requests/login_request.dart';
import 'package:magd_task/data/network/requests/otp_request.dart';
import 'package:magd_task/data/network/responses/help_response.dart';

import 'package:magd_task/data/network/responses/login_response.dart';
import 'package:magd_task/data/network/responses/otp_response.dart';
import 'package:magd_task/data/network/responses/product_response.dart';

import '../../constants/end_points.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  // send email and password to api
  UserLoginResponse? _userLoginResponse;
  String? phone;

  OTPResponse? otpResponse;

  void sendLoginData(LoginRequest loginRequest) {
    emit(LoadingState());
    DioHelper.postData(
            url: loginUrl,
            body: {'name': loginRequest.email, 'phone': loginRequest.phone})
        .then((value) {
      //success of get response
      _userLoginResponse = UserLoginResponse.fromJson(value.data);
      if (_userLoginResponse!.status == 200) {
        emit(LoginSuccessState(_userLoginResponse!.code));
      } else {
        emit(LoginErrorState(_userLoginResponse!.message));
      }
    }).catchError((error) {
      //error
      emit(LoginErrorState(error.toString()));
    });
  }

//verify code
  AccountModel? accountData;

  void sendOTPData(OTPRequest otpRequest) {
    emit(LoadingState());
    DioHelper.postData(
            url: otpUrl,
            body: {'code': otpRequest.code, 'phone': otpRequest.phone})
        .then((value) {
      if (value.data['status'] == 200) {
        accountData = OTPResponse.fromJson(value.data).toModel();
        emit(OTPSuccessState());
      } else {
        emit(OTPErrorState(value.data['message']));
      }
    }).catchError((error) {
      //error
      emit(OTPErrorState(error.toString()));
    });
  }

  // help screen functions

  HelpResponse? helpResponse;
  List<bool> isShow = [];

  void getHelpData() async {
    await DioHelper.getData(url: helpUrl, query: {}).then((value) {
      helpResponse = HelpResponse.fromJson(value.data);
      helpResponse!.help.forEach((element) {
        isShow.add(false);
      });
      emit(HelpSuccessState());
    }).catchError((error) {
      emit(HelpErrorState(error.toString()));
    });
  }

  // List<bool> isShow=[true,true,true,true,false];
  void changeShowState(index) {
    isShow[index] = !isShow[index];
    emit(ChangeHelpContentState());
  }

  // Get Product info
  ProductResponse? productResponse;

  Future<Response?> getProduct() {
    print('get product');
    return  DioHelper.getData(url: getProductUrl, query: {}).then((value) {
    productResponse=ProductResponse.fromJson(value.data);
    print(productResponse!.products[0].company);
    }).catchError(
            (error)
    {
      print('error ${error.toString()}');
    }
    );
  }
}
