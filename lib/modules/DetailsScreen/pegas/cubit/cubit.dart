import 'package:bloc/bloc.dart';
import 'package:carshop/model/details.dart';
import 'package:carshop/modules/DetailsScreen/DetailsCubit/state.dart';
import 'package:carshop/modules/DetailsScreen/pegas/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PegasDetailsCubit extends Cubit<DetailsState> {
  PegasDetailsCubit() : super(DetailsInitialState());

  static PegasDetailsCubit get(context) => BlocProvider.of(context);
  List<DetailsModel>? detailsModel = [];

  void getDetailsData() {
    detailsModel = [];
    emit(GetDetailsDataLoadingState());
    FirebaseFirestore.instance
        .collection('Kia')
        .doc('qRMQR5N3SFgSXsw5VcPn')
        .collection('pigasdetails')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        detailsModel!.add(DetailsModel.fromMap(element.data()));
        print(element.id);
      });
      emit(GetDetailsDataSucState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDetailsDataErrorState());
    });
  }
}
