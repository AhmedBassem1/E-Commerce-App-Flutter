import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/cubit/_cubit.dart';
import 'package:splash/layout/bloc_observer.dart';
import 'package:splash/layout/layout_screen.dart';
import 'package:splash/modules/BottomNavScreen/home_screen.dart';
import 'package:splash/modules/login_screen.dart';
import 'package:splash/modules/BottomNavScreen/profile_screen.dart';
import 'package:splash/modules/sign_up.dart';
import 'package:splash/shared/constent/constent.dart';
import 'package:splash/shared/network/local_network.dart';

import 'modules/boarding_screen.dart';
import 'modules/splash_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  token = await CacheNetwork.getCacheData(key: 'token');
  debugPrint("token is : $token");


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>AuthCubit()..getCarts()..getFavorites()..getBannerData()..getCategoriesData()..getUserData()..getProductsData())
    ], child: 
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: layout_Screen()
        //token != null && token != "" ? profile_Screen() : LoginScreen()
     )
    );
  }
}