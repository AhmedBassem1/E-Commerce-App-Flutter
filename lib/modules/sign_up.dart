import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/cubit/_cubit.dart';
import 'package:splash/modules/BottomNavScreen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();


  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
          }else if(state is FailedRegisterState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
            Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              child: Text(state.massege),)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
            body: Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),

                      ),
                      validator: (index) {
                        if (nameController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "name must not by embty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                        border: OutlineInputBorder(),

                      ),
                      validator: (index) {
                        if (emailController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "email must not by embty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),

                      ),
                      validator: (index) {
                        if (passwordController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "Password must not by embty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        border: OutlineInputBorder(),

                      ),
                      validator: (index) {
                        if (phoneController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "phone must not by embty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    MaterialButton(onPressed: () {
                      if (fromKey.currentState!.validate() == true) {
                        BlocProvider.of<AuthCubit>(context).register(
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            password: passwordController.text);

                      }

                    },
                      child: Text('Register'),
                      color: Colors.blue,
                    )


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
