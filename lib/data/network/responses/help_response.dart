class HelpResponse
{
  int? status;
  String? message;
  List<HelpDataResponse> help=[];

  HelpResponse(this.status,this.message,this.help);

  HelpResponse.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    json['help'].forEach(
        (element)
            {
              help.add(HelpDataResponse.fromJson(element));
            }
    );
  }

}

class HelpDataResponse
{
int? id ;
String? question ;
String? answer ;

//HelpDataResponse(this.id,this.question,this.answer);

HelpDataResponse.fromJson(Map<String,dynamic> json)
{
  id=json['id'];
  question = json['question'];
  answer = json['answer'];
}
}