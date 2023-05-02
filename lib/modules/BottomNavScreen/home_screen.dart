import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash/cubit/_cubit.dart';
import 'package:splash/cubit/_cubit.dart';

import '../../models/Products_model.dart';



class HomeScreen extends StatelessWidget {
  final pageController= PageController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocProvider(
  create: (context) => AuthCubit()..getProductsData(),
  child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                cubit.userModel != null?
                SafeArea(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:29 ),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 158*fem,
                                  height: 40*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // ellipse223dd (101:303)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                        width: 40*fem,
                                        height: 40*fem,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(20*fem),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image:  NetworkImage('${cubit.userModel!.image!}',),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // autogroupxxbhggb (DCQLtDoauaCFG294gtxXBh)
                                        margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 5*fem),
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // welcomeZkP (101:305)
                                              'Welcome',
                                              style: GoogleFonts.inter (

                                                fontSize: 9*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2125*ffem/fem,
                                                color: Color(0xff666666),
                                              ),
                                            ),
                                            Text(
                                              // abrhamnGeo (94:614)
                                              cubit.userModel!.name!,
                                              style: GoogleFonts.inter (

                                                fontSize: 12*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2125*ffem/fem,
                                                color: Color(0xff333333),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      // TextButton(onPressed: (){},
                                      //     style: TextButton.styleFrom(
                                      //       padding:EdgeInsets.zero
                                      //     ),
                                      //     child:  Container(
                                      //       width: 16,
                                      //       height: 16,
                                      //       decoration:BoxDecoration(
                                      //           borderRadius: BorderRadius.circular(10),
                                      //           image: DecorationImage(
                                      //             image: AssetImage('images/icons/notification.png'),
                                      //           )
                                      //       ) ,
                                      //     ))
                                    ],
                                  ),

                                ),
                              ),
                            ),
                            // notifcation bell
                            Padding(
                              padding: const EdgeInsets.only(left: 140),
                              child: TextButton(onPressed: (){},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero
                                  ),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage('images/icons/notification.png')
                                        )
                                    ),
                                  )),
                            )

                          ],
                        ),

                      ),
                      Divider(
                        color: Color(0xFFD9D9D9),
                        indent: 17,
                        endIndent: 17,
                        thickness: 1,
                      ),



                    ],
                  ),

                ):Center(child: CircularProgressIndicator(),),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29,top: 15 ),
                      child: Row(
                        children: [
                          Align(
                            child: SizedBox(
                              width: 2 * fem,
                              height: 20 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffff4500),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Center(
                              child: Align(
                                child: Text(
                                  'HOT PRODUCTS',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(

                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xff0074d9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          cubit.banners.isEmpty?
                          Center(child: CupertinoActivityIndicator.partiallyRevealed(),):
                          SizedBox(
                            height: 135,
                            width: double.infinity,
                            child: PageView.builder(
                                controller: pageController,
                                physics: BouncingScrollPhysics(),

                                itemCount: 3 ,
                                itemBuilder:(context,index){
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image:  NetworkImage('${cubit.banners[index].url!}',),
                                          fit: BoxFit.fill

                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0*fem, 4*fem),
                                          blurRadius: 2*fem,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 296,right: 30,top: 58,bottom: 53),
                                          child: Align(
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Container(

                                                decoration: BoxDecoration (

                                                  borderRadius: BorderRadius.circular(12*fem),
                                                  image: DecorationImage(image:  AssetImage('images/icons/next.png'),),
                                                  color: Color(0xffffffff),

                                                ),


                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } ),
                          ),
                          SizedBox(
                            height: 21,
                          ),

                          Center(
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count:  3,
                              axisDirection: Axis.horizontal,
                              effect:  SlideEffect(
                                  spacing:  8.0,
                                  radius:  3.0,
                                  dotWidth:  17.0,
                                  dotHeight:  6.0,
                                  paintStyle:  PaintingStyle.stroke,
                                  strokeWidth:  1.5,
                                  dotColor:  Color(0xFF333333),
                                  activeDotColor:  Color(0xFF333333)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29,right: 33,),
                      child: Row(
                        children: [
                          Align(
                            child: SizedBox(
                              width: 2 * fem,
                              height: 20 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffff4500),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: Align(
                                child: Text(
                                  'CATEGORIES',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter (

                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xff0074d9),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'See All',

                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter (
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xff0074d9),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    cubit.categories.isEmpty?
                    Center(child: CupertinoActivityIndicator.partiallyRevealed(),):
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ListView.separated(
                            separatorBuilder: (context,index){
                              return SizedBox(
                                width: 10,
                              );
                            },

                            physics: BouncingScrollPhysics(),

                            itemCount: cubit.categories.length ,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context,index){
                              return Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage('${cubit.categories[index].url!}'),
                                          fit: BoxFit.fill,

                                        ),
                                        color:Color(0xFF0074D9)

                                    ),

                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  cubit.categories.isEmpty?
                                  Center(child: CupertinoActivityIndicator.partiallyRevealed(),):
                                  Container(

                                    child: Text(cubit.categories[index].name!,style: TextStyle(
                                        fontSize: 10
                                    ),
                                    ),
                                  ),
                                ],
                              );
                            } ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29,),
                      child: Row(
                        children: [
                          Align(
                            child: SizedBox(
                              width: 2 * fem,
                              height: 20 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffff4500),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Center(
                              child: Align(
                                child: SizedBox(
                                  // width: 179*fem,
                                  // height: 21*fem,
                                  child: Text(
                                    'PRODUCTS',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter (

                                      fontSize: 17*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125*ffem/fem,
                                      color: Color(0xff0074d9),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    const SizedBox(height: 15,),
                    cubit.banners.isEmpty ?
                    const Center(child: CircularProgressIndicator(),) :
                    GridView.builder(
                        itemCount: cubit.filteredProducts.isEmpty ?
                        cubit.products.length :
                        cubit.filteredProducts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.7
                        ),
                        itemBuilder: (context,index)
                        {
                          return _productItem(
                              model:
                              cubit.products[index],
                            cubit: cubit
                          );
                        }
                    )

                  ],
                ),
              ],
            ),
          );
        },
      ),
);
  }
}

Widget _productItem({required ProductModel model,required AuthCubit cubit}){
  return Column(
    children: [
      Container(
        height: 250,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          color:Color(0xFFFFFFFF),

          boxShadow: [
            BoxShadow(
              color: Color(0xFF696969),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],

        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 153,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage('${model.image}'),
                        fit: BoxFit.fill
                    )

                ),

              ),
            ),
            Padding(

              padding: const EdgeInsets.only(left: 10,top: 13,right: 45),
              child: Text(

                "${model.name}",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter (

                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.2125,
                  color: Color(0xFF333333),

                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(

              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15),
                    child: Text(
                      "${model.price!}\$",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter (

                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: Color(0xFFFF4500),

                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Text(
                      "${model.old_price!}\$",

                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter (

                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.2125,
                          color: Color(0xFF0074D9),
                          textStyle: TextStyle(
                              decoration: TextDecoration.lineThrough
                          )

                      ),
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(

                    child: Icon(Icons.favorite,color:cubit.favoritesID.contains(model.id.toString())? Color(0xFFFF4500):Colors.grey,size: 20),
                    onTap: (){
                      cubit.addOrRemoveFromFavorites(productID: model.id.toString());
                    },

                  ),
                )
              ],
            )
          ],
        ),

      ),


    ],
  );
}


