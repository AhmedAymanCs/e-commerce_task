import 'package:magd_task/data/models/account_model.dart';

import 'package:magd_task/data/network/responses/otp_response.dart';

extension AccountinfoExtention on AccountDataResponse?
{
  AccountData toModel()
  {
    return AccountData(this?.id?? 0 , this?.name ?? 'not found', this?.phone ??'');
  }
}

extension AcountDataExtention on OTPResponse?
{
  AccountModel? toModel( )
  {
    return AccountModel(this?.status ??0, this?.message??'', this!.account.toModel());
  }
}

