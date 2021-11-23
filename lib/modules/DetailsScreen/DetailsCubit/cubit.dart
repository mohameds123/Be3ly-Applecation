import 'package:bloc/bloc.dart';
import 'package:carshop/model/carModel.dart';
import 'package:carshop/modules/DetailsScreen/DetailsCubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsSState>{
  DetailsCubit() : super(DetailsSInitialState());
  static DetailsCubit get(context) => BlocProvider.of(context);
  List<CarsModel>? carsModel = [];
  void getKiaCarsData(String carName){
    carsModel = [];
    emit(GetDetailsSDataLoadingState());
    FirebaseFirestore.instance
        .collection(carName)
        .get()
        .then((value){
      value.docs.forEach((element) {
        carsModel!.add(CarsModel.fromMap(element.data()));
        print(element.id);
      });
      emit(GetDetailsSDataSucState());
    }).catchError((error){
      print(error.toString());
      emit(GetDetailsSDataErrorState());
    });
  }
}