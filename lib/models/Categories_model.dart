class CategoriesModel{
  int ? id;
  String ? url;
  String ? name;


  CategoriesModel.fromJason({required Map<String,dynamic>data}){
    id=data['id'];
    name = data['name'];
    url = data['image'];



  }
}