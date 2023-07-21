// ignore_for_file: prefer_typing_uninitialized_variables

part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
 final code;

  LoginSuccessState(this.code);

}

class LoginErrorState extends GlobalState {
 final  error;
 static String? errorToUser ;
  LoginErrorState(this.error)
  {
    errorToUser=error;
  }


}

class OTPSuccessState extends GlobalState {}

class OTPErrorState extends GlobalState {
 final  error;
 static String? errorToUser ;
 OTPErrorState(this.error)
 {
  errorToUser=error;
 }


}



class HelpInitial extends GlobalState {}


class HelpSuccessState extends GlobalState {}

class HelpErrorState extends GlobalState {
 final error;
 static String? errorToUser;

 HelpErrorState(this.error) {
  errorToUser = error;
 }
}

class ChangeHelpContentState extends GlobalState {}

