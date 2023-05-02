import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../cubit/_cubit.dart';

class cartSreen extends StatelessWidget {
   cartSreen({Key? key}) : super(key: key);
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
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.7,


        title: Text(
          'Carts',
          style: GoogleFonts.inter (
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.2125,
            color: Color(0xff333333),
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Total Price : ${cubit.totalPrice}'.toString()),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),

              itemCount:cubit.carts.length ,
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
                                      image: NetworkImage('${cubit.carts[index].image}'),
                                      fit: BoxFit.fill)
                              ),

                            ),
                          ),

                          Expanded(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${cubit.carts[index].name}",style: GoogleFonts.inter(

                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xFF414141),
                                ),overflow:TextOverflow.ellipsis ),
                                Text('${cubit.carts[index].description}',style: GoogleFonts.inter(

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
                                      cubit.addOrRemoveFromCarts(id: cubit.carts[index].id.toString());
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

                                    child: Text('${cubit.carts[index].price}\$',
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

          ],
        ),
      ),



    );
  },
);
  }
}
