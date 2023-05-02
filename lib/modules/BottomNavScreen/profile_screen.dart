import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/cubit/_cubit.dart';


class profile_Screen extends StatelessWidget {
  const profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocProvider(
       create: (context) => AuthCubit()..getUserData(),
       child: BlocConsumer<AuthCubit,AuthState>(
         listener: (context,state){

         },
         builder: (context,state){
           return Container();
           // Scaffold(
           //     appBar: AppBar(
           //       backgroundColor: Colors.transparent,
           //       elevation: 0,
           //       actions: [
           //         Padding(
           //           padding: const EdgeInsets.all(8.0),
           //           child: Icon(
           //             Icons.search,
           //             color: Colors.black,
           //             size: 25,
           //           ),
           //         )
           //       ],
           //     ),
           //     body: cubit.userModel != null
           //         ? SizedBox(
           //       width: double.infinity,
           //       height: double.infinity,
           //       child: ListView(
           //         physics: BouncingScrollPhysics(),
           //         shrinkWrap: true,
           //         children: [
           //           Padding(
           //             padding: const EdgeInsetsDirectional.only(
           //                 top: 14, start: 14, end: 14,bottom: 90),
           //             child: Column(
           //               crossAxisAlignment: CrossAxisAlignment.start,
           //               children: [
           //                 Text(
           //                   'My profile',
           //                   style: TextStyle(
           //                       fontSize: 32,
           //                       color: Colors.black,
           //                       fontWeight: FontWeight.bold),
           //                 ),
           //                 const SizedBox(
           //                   height: 4,
           //                 ),
           //                 ListTile(
           //                   leading: const Icon(
           //                     Icons.account_circle_outlined,
           //                     size: 60,
           //                   ),
           //                   title: Text(
           //                     cubit.userModel!.name!.toString(),
           //                     style: TextStyle(
           //                         fontWeight: FontWeight.bold,
           //                         fontSize: 18,
           //                         color: Colors.red),
           //                   ),
           //                   subtitle: Text(
           //                     cubit.userModel!.email!.toString(),
           //                     style: TextStyle(
           //                         fontWeight: FontWeight.bold,
           //                         fontSize: 11,
           //                         color: Colors.cyan.withOpacity(0.4)),
           //                   ),
           //                 ),
           //                 const SizedBox(
           //                   height: 6,
           //                 ),
           //                 const CustomContainer(
           //                     title: 'Account Information',
           //                     subTitle: 'phone number, email, password'),
           //                 const SizedBox(
           //                   height: 20,
           //                 ),
           //                 const CustomContainer(
           //                     title: 'Payment Methods',
           //                     subTitle: 'Visa **85'),
           //                 const SizedBox(
           //                   height: 20,
           //                 ),
           //                 const CustomContainer(
           //                     title: 'My Orders', subTitle: 'Have X orders'),
           //                 const SizedBox(
           //                   height: 20,
           //                 ),
           //                 const CustomContainer(
           //                     title: 'Shipping addresses',
           //                     subTitle: 'X addresses'),
           //                 const SizedBox(
           //                   height: 20,
           //                 ),
           //                 const CustomContainer(
           //                     title: 'Settings',
           //                     subTitle: 'Notifications, passwords'),
           //               ],
           //             ),
           //           ),
           //         ],
           //       ),
           //     )
           //         : Center(
           //       child: CircularProgressIndicator(
           //         color: Colors.blue,
           //       ),
           //     ),
           //   );
         },
       ),
   );


  }
}

// class CustomContainer extends StatelessWidget {
//   const CustomContainer({Key? key, required this.title, required this.subTitle})
//       : super(key: key);
//   final String title, subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.green, borderRadius: BorderRadius.circular(5)),
//       child: ListTile(
//         title: Text(
//           title,
//           style: TextStyle(
//               fontSize: 12, fontWeight: FontWeight.bold, color: Colors.amber),
//         ),
//         subtitle: Text(
//           subTitle,
//           style: TextStyle(fontSize: 10, color: Colors.greenAccent.withOpacity(.5)),
//         ),
//         trailing: Icon(
//           Icons.arrow_forward_ios_rounded,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
