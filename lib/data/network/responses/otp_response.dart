class OTPResponse
{
  int? status;
  String? message;
  AccountDataResponse? account;

  OTPResponse(this.status,this.message,this.account);

  OTPResponse.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    account = AccountDataResponse.fromJson(json['account']);
  }

}

class AccountDataResponse
{
  int? id;
  String? name;
  String? phone;

  AccountDataResponse(this.id,this.name,this.phone);

  AccountDataResponse.fromJson(Map<String,dynamic>? json)
  {
    id=json!['id'];
    name=json['name'];
    phone=json['phone'];
  }
}