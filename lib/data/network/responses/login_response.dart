class UserLoginResponse
{
   int? status;
  String? message;
  String? code ;
   UserLoginResponse(this.status,this.message,this.code);

   UserLoginResponse.fromJson(Map<String,dynamic> json)
  {
    status= json['status'];
    message= json['message'];
    code= json['code'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'status':status,
        'message':message,
        'code':code,
      };
  }

}