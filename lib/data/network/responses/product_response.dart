class ProductResponse
{
  int? status;
  String? message ;
  List<ProductInfoResponse> products=[];

  ProductResponse.fromJson(Map<String,dynamic> json)
  {
    status= json['status'];
    message= json['message'];
    json['products'].forEach(
        (element)
        {
          products.add(ProductInfoResponse.fromJson(element));
        }
    );
  }
}

class ProductInfoResponse
{
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;
  ProductInfoResponse.fromJson(Map<String,dynamic> json)
  {
    id= json['id'];
    company= json['company'];
    name= json['name'];
    type= json['type'];
    price= json['price'];
    image= json['image'];
    description= json['description'];
  }

}
