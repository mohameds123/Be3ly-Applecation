import 'package:bloc/bloc.dart';
import 'package:carshop/model/usermodel.dart';
import 'package:carshop/modules/register/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<SocialRegisterState>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterCubit():super(InitialRegisterState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  void userRegister(){
    emit(LoadingRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ).then((value){
      setData(
        uId:value.user!.uid,
      );
      emit(RegisterSuccessState());
    }).catchError((error){
      print('User Authentication Error=>${error.toString()}');
      emit(RegisterErrorState());
    });
  }
  void setData({
    required String uId,
  }){
    emit(SetUserDataLoadingsState());
    UserModel usermodel = UserModel(
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .set(usermodel.toMap())
        .then((value){
      emit(SetUserDataSuccessState());
    }).catchError((error){
      print('set user Error=>${error.toString()}');
      emit(SetUserDataErorrState());
    });
  }
}