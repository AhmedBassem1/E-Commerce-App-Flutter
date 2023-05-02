import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/modules/BottomNavScreen/home_screen.dart';
import 'package:splash/modules/sign_up.dart';

import '../cubit/_cubit.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/auth_background.png"),
              fit: BoxFit.fill),

        ),

        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is LoginSuccessState){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
            if(state is FailedLoginState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
                alignment:Alignment.center,
                height: 50,
                child: Text(state.massege),
              )));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                    flex: 1, child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text('Login to continue process',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                )),
                Expanded(flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login', style: TextStyle(fontSize: 30,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (input) {
                                if (emailController.text.isNotEmpty) {
                                  return null;
                                }
                                else {
                                  return "Email must not be empty";
                                }
                              },


                            ),
                            SizedBox(
                              height: 27,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (input) {
                                if (passwordController.text.isNotEmpty) {
                                  return null;
                                }
                                else {
                                  return "Password must not be empty";
                                }
                              },


                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(onPressed: () {
                              if (formKey.currentState!.validate() == true) {
                                BlocProvider.of<AuthCubit>(context).login(
                                  email: emailController.text,
                                  password: passwordController.text,);
                              }
                            },
                              minWidth: double.infinity,
                              color: Colors.green,
                              textColor: Colors.white,
                              child: FittedBox(fit:BoxFit.scaleDown,child: Text(state is LoginLoadingState ? "Loading..." : "Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.5),)),

                            ),
                            SizedBox(height: 5,),
                             RichText(text: TextSpan(
                               children: [
                                 TextSpan(text: 'Forget your password',style: TextStyle(color: Colors.black,fontSize: 16)),
                                 TextSpan(text: ' Click Here',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16)),

                               ]
                             )),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                const Text('Don\'t have an account? ',style: TextStyle(color: Colors.black,fontSize: 16,)),
                                SizedBox(width: 4,),
                                InkWell(
                                  onTap: ()
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                  },
                                  child: const Text('Create one',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 16,)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )

                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
