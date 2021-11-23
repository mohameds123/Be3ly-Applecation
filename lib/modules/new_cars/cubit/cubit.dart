import 'package:bloc/bloc.dart';
import 'package:carshop/model/newcars.dart';
import 'package:carshop/modules/new_cars/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCarsCubit extends Cubit<NewCarsStates>{
  NewCarsCubit() : super(InitialState());
  static NewCarsCubit get(context) => BlocProvider.of(context);
  List<NewCarsModel>? newCarsModel = [];
  void getNewCarsData(){
    newCarsModel = [];
    emit(GetNewCarsDataLoadingState());
    FirebaseFirestore.instance
        .collection('newacrs')
        .get()
        .then((value){
      value.docs.forEach((element) {
        newCarsModel!.add(NewCarsModel.fromMap(element.data()));
        print(element.id);
      });
      emit(GetNewCarsDataSucState());
    }).catchError((error){
      print(error.toString());
      emit(GetNewCarsDataErrorState());
    });
  }
}