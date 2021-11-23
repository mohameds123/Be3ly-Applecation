import 'package:bloc/bloc.dart';
import 'package:carshop/modules/login/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit():super(InitialState());
  void userLogin(){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
     email: emailController.text,
      password:passwordController.text,
    ).then((value){
      emit(LoginSuccessState());
    }).catchError((error){
      print('user Authentication Error=>${error.toString()}');
      emit(LoginErrorState());
    });
  }
}