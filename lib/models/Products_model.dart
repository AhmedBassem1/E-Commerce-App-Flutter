class ProductModel{
  String? name;
  String? description;
  int? price;
  int? id;
  int? old_price;
  int? discount;
  String? image;

  ProductModel.fromJson({required Map<String,dynamic> data}){

    name = data['name'].toString();
    description = data['description'].toString();
    price = data['price'].toInt();
    id = data['id'].toInt();
    old_price = data['old_price'].toInt();
    discount = data['discount'].toInt();
    image = data['image'].toString();






  }


}