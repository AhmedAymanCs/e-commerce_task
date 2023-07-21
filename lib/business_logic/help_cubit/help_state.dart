abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoadingState extends HelpState{}
class HelpSuccessState extends HelpState {}

class HelpErrorState extends HelpState {
  final  error;
  static String? errorToUser ;
  HelpErrorState(this.error)
  {
    errorToUser=error;
  }


}
