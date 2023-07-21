import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_task/business_logic/help_cubit/help_state.dart';


class HelpCubit extends Cubit<HelpState> {

  HelpCubit() : super(HelpInitial());

 static HelpCubit get(context) => BlocProvider.of(context);


}
