import 'package:carshop/companats/file_companates.dart';
import 'package:carshop/modules/layout/layout.dart';
import 'package:carshop/modules/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <LoginCubit , LoginState>(
      listener: (context , state){
        if(state is LoginSuccessState){
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context)=>Bee3Layout(),
              ),
                  (route) => true
          );
        }
      },
      builder: (context , state)=> Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/c.jpg'),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 16.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            DefaultFormField(
                              prefix: Icons.email_outlined,
                              lable: 'Email Address',
                              controller: LoginCubit.get(context).emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DefaultFormField(
                              prefix: Icons.lock_outline,
                              lable: 'Password',
                              controller: LoginCubit.get(context).passwordController,
                              type: TextInputType.visiblePassword,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  print("Please enter some text");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Forget Password?',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            if(state is!LoginLoadingState)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child:Center(
                  child: Container(
                    height: 50,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: HexColor('0148A3'),
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        LoginCubit.get(context).userLogin();
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context)=>Bee3Layout(),
                          ),
                        );
                      },
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if(state is LoginLoadingState)
              Center(child: CircularProgressIndicator()),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don`t have an account?',
                ),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context)=>RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}