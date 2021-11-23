import 'package:carshop/companats/file_companates.dart';
import 'package:carshop/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class RegisterScreen extends StatelessWidget {

  var form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,SocialRegisterState>(
      listener: (context,state) {
        if (state is RegisterSuccessState) {
          navigateAndFinish(
            context: context,
            widget: LoginScreen(),
          );
        }
      },
      builder: (context,state)=> Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading:IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.network(
                  'https://ymimg1.b8cdn.com/uploads/article/3786/pictures/2777122/Hidden_car_logo.png',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: form_key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultFormField(
                        validator:(value){
                          if(value!.isEmpty) {
                            return 'please enter any text';
                          }
                          return null;
                        },
                        prefix: Icons.email,
                        lable: 'Email Address',
                        controller: RegisterCubit.get(context).emailController,
                        type: TextInputType.emailAddress
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                        validator:(value){
                          if(value!.isEmpty) {
                            return 'please enter any text';
                          }
                          return null;
                        },
                        prefix: Icons.lock_outline,
                        lable: 'Password',
                        controller: RegisterCubit.get(context).passwordController,
                        type: TextInputType.visiblePassword
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 16.0,
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed:(){
                          if(form_key.currentState!.validate()){
                            RegisterCubit.get(context).userRegister();
                          }
                        },
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}