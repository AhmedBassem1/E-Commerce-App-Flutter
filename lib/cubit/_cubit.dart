import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:splash/models/Products_model.dart';
import 'package:splash/models/user_model.dart';
import 'package:splash/modules/BottomNavScreen/cart_sreen.dart';
import 'package:splash/modules/BottomNavScreen/search_screen.dart';
import 'package:splash/modules/BottomNavScreen/favorite_screen.dart';
import 'package:splash/modules/BottomNavScreen/home_screen.dart';
import 'package:splash/shared/constent/constent.dart';
import 'package:splash/shared/network/local_network.dart';

import '../models/Bannar_model.dart';
import '../models/Categories_model.dart';
import '../modules/BottomNavScreen/profile_screen.dart';

part '_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Initial());
  int bottomNavbar=0;
  List<Widget> layoutScreens=[HomeScreen(),FavoriteScreen() ,SearchScreen(),cartSreen(),profile_Screen()];

  void changeBottomNavbar({required int index}){
    bottomNavbar = index;
    emit(ChangeBottomNavIndexState());
  }

  void register({
    required String email,
    required String name,
    required String phone,
    required String password})async{
    emit(RegisterLoadingState());
    try{
      Response response= await http.post(
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'name' : name,
          'email' : email,
          'phone' : phone,
          'password' : password,



        },
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);

        if(data['status'] == true){
          print("respons is = $data");
          emit(RegisterSuccessState());
        }else{
          print("respons is = $data");
          emit(FailedRegisterState(massege:  data['massege']));
        }
      }
    }catch(e){
      emit(FailedRegisterState(massege: e.toString()));
    }

  }

  void login({required String email, required String password,})async{
    emit(LoginLoadingState());
    try{
      Response response =await http.post(Uri.parse('https://student.valuxapps.com/api/login'),
        body: {
          'email' : email,
          'password' : password,
        },
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        if(data['status']== true){
          // debugPrint("User Login Success and his data is : $data");
           await CacheNetwork.insertToCache(key: "token", value: data['data']['token']);
          emit(LoginSuccessState());
        }else {
          debugPrint("User Login Success and his data is : ${data['massege']}");
          emit(FailedLoginState(massege: data['massege']));
        }

      }

    }catch(e){
      emit(FailedLoginState( massege: e.toString()));
    }


  }

  UserModel? userModel;
  void getUserData()async{
    emit(GetUserDataLoadingState());
     Response response =await http.get(
         Uri.parse("https://student.valuxapps.com/api/profile"),
         headers:
         {
       "Authorization": token!,
           "lang": "en",
         }
     );
     var responseData = jsonDecode(response.body);
     if(responseData['status']=true)
     {
       userModel = UserModel.fromJson(data: responseData['data']);
       print("response is : $responseData");
       emit(GetUserDataSuccessState());
     }
     else
     {
       emit(FailedGetUserDataState(massege: responseData['message']));
     }

  }


  List<BannerModel> banners=[];
  void getBannerData()async{
    emit(GetBannersLoadingState());
   Response response= await http.get(
       Uri.parse('https://student.valuxapps.com/api/banners'));
   final responseBody = jsonDecode(response.body);
   if(responseBody['status'] == true){
     for(var item in responseBody['data']){
       banners.add(BannerModel.fromJason(data: item));
     }

     emit(GetBannersSuccessState());
   }else{
     emit(FailedGetBannersState());
   }
  }

  List<CategoriesModel> categories=[];
  void getCategoriesData()async{
    emit(GetCategoriesLoadingState());
    Response response= await http.get(
        Uri.parse('https://student.valuxapps.com/api/categories'),
    headers:{
      "lang": "en",

    }
    );

    final responseBody = jsonDecode(response.body);
    if(responseBody['status'] == true){
      for(var item in responseBody['data']['data']){
        categories.add(CategoriesModel.fromJason(data: item));
      }

      emit(GetCategoriesSuccessState());
    }else{
      emit(FailedGetCategoriesState());
    }
  }


  List<ProductModel> products=[];
  void getProductsData()async{
    Response response= await http.get(
        Uri.parse('https://student.valuxapps.com/api/home'),
        headers:{
          "Authorization": token!,
          "lang": "en",

        }
    );

    final responseBody = jsonDecode(response.body);
    if(responseBody['status'] == true)
    {
      for(var item in responseBody['data']['products'])
      {
        products.add(ProductModel.fromJson(data: item));
      }

      emit(GetProductsSuccessState());
    }else{
      emit(FailedGetProductsState());
    }
  }

  List<ProductModel> filteredProducts = [];
  void filterProducts({required String input})
  {
    filteredProducts = products.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(FilterProductsSuccessState());
  }

  List<ProductModel> favorites=[];
  Set<String> favoritesID = {};
  Future<void> getFavorites() async {
    favorites.clear();
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/favorites"),
        headers:
        {
          "lang" : "en",
          "Authorization" : token!
        }
    );
    // http
    var responseBody = jsonDecode(response.body);
    if( responseBody['status'] == true )
    {
      // loop list
      for( var item in responseBody['data']['data'] )
      {
        // Refactoring
        favorites.add(ProductModel.fromJson(data: item['product']));
        favoritesID.add(item['product']['id'].toString());
      }
      print("Favorites number is : ${favorites.length}");
      emit(GetFavoritesSuccessState());
    }
    else
    {
      emit(FailedGetFavoritesState());
    }
  }

  void addOrRemoveFromFavorites({required String productID })async{
   Response response=await http.post(Uri.parse("https://student.valuxapps.com/api/favorites"),
    headers:
    {
      "lang" : "en",
      "Authorization" : token!
    },
    body:
    {
    "product_id":productID,
    }
    );
    var responseBody= jsonDecode(response.body);
    if(responseBody['status']==true)
    {
      if(favoritesID.contains(productID)==true)
      {
        favoritesID.remove(productID);
      }else{
        favoritesID.add(productID);
      }
     await getFavorites();
      emit(AddOrRemoveItemFromFavoritesSuccessState());
    }
    else
    {
      emit(FailedToAddOrRemoveItemFromFavoritesState());
    }
  }


  List<ProductModel> carts = [];
  int totalPrice = 0;
  Set<String> cartsID = {};

  Future<void> getCarts() async {
    carts.clear();
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/carts"),
        headers:
        {
          "Authorization" : token!,
          "lang" : "en"
        }
    );
    var responseBody = jsonDecode(response.body.toString());
    if( responseBody['status'] == true )
    {
      // success
      for ( var item in responseBody['data']['cart_items'] )
      {
        carts.add(ProductModel.fromJson(data: item['product']));
      }
      totalPrice = responseBody['data']['total'];
      debugPrint("Carts length is : ${carts.length}");
      emit(GetCartSuccessState());
    }
    else
    {
      // failed
      emit(FailedGetCartState());
    }
  }

  void addOrRemoveFromCarts({required String id })async{
    Response response=await http.post(Uri.parse("https://student.valuxapps.com/api/carts"),
        headers:
        {
          "lang" : "en",
          "Authorization" : token!
        },
        body:
        {
          "product_id":id,
        }
    );
    var responseBody= jsonDecode(response.body);
    if(responseBody['status']==true)
    {
      cartsID.contains(id)==true? cartsID.remove(id): cartsID.add(id);
      await getCarts();
      emit(AddOrRemoveItemFromCartsSuccessState());
    }
    else
    {
      emit(FailedToAddOrRemoveItemFromCartsState());
    }
  }



}
