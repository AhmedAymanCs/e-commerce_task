class AccountModel
{
  int status;
  String message;
  AccountData account;

  AccountModel(this.status,this.message,this.account);

}

class AccountData
{
  int id;
  String name;
  String phone;

  AccountData(this.id,this.name,this.phone);

}