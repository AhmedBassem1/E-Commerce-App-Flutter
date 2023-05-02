import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash/cubit/_cubit.dart';
import 'package:splash/cubit/_cubit.dart';

import '../../models/Products_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
          return  SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (input){
                        cubit.filterProducts(input: input);
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        suffixIcon: const Icon(Icons.clear),
                        filled: true,
                        fillColor: Colors.black12.withOpacity(0.1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 17),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                cubit.banners.isEmpty ?
                const Center(child: CupertinoActivityIndicator(),) :
                GridView.builder(
                    itemCount: cubit.filteredProducts.isEmpty ?
                    cubit.products.length :
                    cubit.filteredProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        childAspectRatio: 0.7
                    ),
                    itemBuilder: (context,index)
                    {
                      return _productItem(
                          model: cubit.filteredProducts.isEmpty ?
                          cubit.products[index] :
                          cubit.filteredProducts[index],

                      ) ;
                    }
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
Widget _productItem({required ProductModel model}){

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

                    child: Icon(Icons.star,color: Color(0xFFFF4500),size: 20),
                    onTap: (){},

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
