class BannerModel{
  int ? id;
  String ? url;

  BannerModel.fromJason({required Map<String,dynamic>data}){
    id=data['id'];
    url = data['image'];

  }
}