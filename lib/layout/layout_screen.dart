import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/cubit/_cubit.dart';

class layout_Screen extends StatelessWidget {
  const layout_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        builder: (context,state){
          return Scaffold(
            // bottomNavigationBar: Stack(
            //   children: [
            //     BlocProvider.of<AuthCubit>(context).layoutScreens.elementAt(bottomNavbar),
            //     Padding(
            //       padding: const EdgeInsets.all(30.0),
            //       child: Align(
            //         alignment: Alignment(0.0,1.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.all(
            //            Radius.circular(30)
            //           ),
            //           child: BottomNavigationBar(
            //               selectedItemColor: Colors.red,
            //               unselectedItemColor: Colors.white,
            //               type: BottomNavigationBarType.fixed,
            //               backgroundColor: Colors.black,
            //               showSelectedLabels: true,
            //               showUnselectedLabels: false,
            //               currentIndex: BlocProvider.of<AuthCubit>(context).bottomNavbar ,
            //               onTap: (index){
            //                 BlocProvider.of<AuthCubit>(context).changeBottomNavbar(index: index);
            //               },
            //               items: [
            //                 BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            //                 BottomNavigationBarItem(icon: Icon(Icons.category_sharp),label: "Category"),
            //                 BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorite"),
            //                 BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            //                 BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
            //               ]
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            body:Stack(
              children: [
                BlocProvider.of<AuthCubit>(context).layoutScreens[BlocProvider.of<AuthCubit>(context).bottomNavbar],
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment(0.0,1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(30)
                      ),
                      child: BottomNavigationBar(
                          selectedItemColor: Color(0xFFFF4500),
                          unselectedItemColor: Colors.white,
                          type: BottomNavigationBarType.fixed,
                          backgroundColor:  Color(0xFF333333),

                          showSelectedLabels: true,
                          showUnselectedLabels: false,
                          currentIndex: BlocProvider.of<AuthCubit>(context).bottomNavbar ,
                          onTap: (index){
                            BlocProvider.of<AuthCubit>(context).changeBottomNavbar(index: index);
                          },
                          items: [
                            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
                            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Favorite"),
                            BottomNavigationBarItem(icon: Icon(Icons.search_sharp),label: "Search"),
                            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
                            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context,state){
          
        });
  }
}
