import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
  create: (context) => AuthCubit()..getFavorites(),
  child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.7,


          title: Text(
            'Favorites',
            style: GoogleFonts.inter (
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.2125,
              color: Color(0xff333333),
            ),
          ),
          bottom: TabBar(

              automaticIndicatorColorAdjustment: false,
            indicatorColor: Color(0xFFFFFFFF),
              unselectedLabelColor: Color(0xFF666666),
              isScrollable: false,
              unselectedLabelStyle: GoogleFonts.inter (
                fontSize: 10,


                height: 1.2125,
                color: Color(0xFF666666),
              ),
              labelStyle: GoogleFonts.inter (
                fontSize: 15,

                height: 1.2125,
                color: Color(0xFF333333),
              ),
              labelColor: Color(0xFF333333),


              tabs: [
            Tab(child: Tab(
              icon: Image.asset(
                'images/icons/sort.png',
                height: 16,
                color: Color(0xFF333333),
              ),
              text: 'Filters',),),
                Tab(
                  icon: Image.asset(
                  'images/icons/up-and-down-arrow.png',
                  height: 16,
                  color: Color(0xFF333333),
                ),
                  text: 'Price: lowest to high',),

          ]),
        ),
        body: TabBarView(
          children: [


            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),

              itemCount:cubit.favorites.length ,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Container(
                    height: 104,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Container(
                            height: 78,
                            width: 78,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: NetworkImage('${cubit.favorites[index].image}'),
                              fit: BoxFit.fill)
                            ),

                          ),
                        ),

                        Expanded(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${cubit.favorites[index].name}",style: GoogleFonts.inter(

                                fontSize: 10 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xFF414141),
                              ),overflow:TextOverflow.ellipsis ),
                              Text('${cubit.favorites[index].description}',style: GoogleFonts.inter(

                                fontSize: 10 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xFF666666),
                              ),overflow:TextOverflow.ellipsis,maxLines: 2),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                             Container(
                               width: 20,
                               height: 20,


                               child: IconButton(
                                 onPressed: (){
                                   cubit.addOrRemoveFromFavorites(productID: cubit.favorites[index].id.toString());
                                 },
                                 icon: Icon(Icons.add,color: Colors.black,),
                                 padding: EdgeInsets.all(5),
                                 iconSize: 10,
                               ),
                             ),
                              SizedBox(
                                height: 5,

                              ),
                              Align(

                                  child: Text('${cubit.favorites[index].price}\$',
                                      style: GoogleFonts.inter(

                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xFFFF4500),
                                      ),)
                              ),
                              SizedBox(
                                height: 27,
                              ),
                              Align(

                                  child: Text('icon',style: TextStyle(color: Colors.black))),
                            ],
                          ),
                        )


                      ],
                    ),
                  )
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),

              itemCount:2 ,
              itemBuilder: (context,index){
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Container(
                      height: 104,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF2F2F2),
                      ),
                      child: Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              height: 78,
                              width: 78,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.black
                              ),

                            ),
                          ),

                          Expanded(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ndflvnsnfbsa;dfmsdfnvfvnsdfvmdlfkvsfnhuhguigukvnionkuyv",overflow:TextOverflow.ellipsis ),
                                Text('data'),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,


                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.add,color: Colors.black,),
                                    padding: EdgeInsets.all(5),
                                    iconSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,

                                ),
                                Align(

                                    child: Text('Price\$',style: TextStyle(color: Colors.black))),
                                SizedBox(
                                  height: 27,
                                ),
                                Align(

                                    child: Text('icon',style: TextStyle(color: Colors.black))),
                              ],
                            ),
                          )


                        ],
                      ),
                    )
                );
              },
            )
          ],
        ),

      ),
    );
  },
),
);
  }
}
