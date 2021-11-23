import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:carshop/companats/file_companates.dart';
import 'package:carshop/model/bee3model.dart';
import 'package:carshop/model/usermodel.dart';
import 'package:carshop/modules/bee3/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:multi_image_picker2/multi_image_picker2.dart';

class Bee3Cubit extends Cubit<Bee3State> {
  Bee3Model? bee3model;

  UserModel? userModel;
  TextEditingController modelController = TextEditingController();
  TextEditingController elmadenaController = TextEditingController();
  TextEditingController model3amController = TextEditingController();
  TextEditingController toraztroller = TextEditingController();
  TextEditingController no3NaqelEl7rakaController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController whatsappNamberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Bee3Cubit() : super(IntialState());

  static Bee3Cubit get(context) => BlocProvider.of(context);

  void textEmpty() {
    bee3model = Bee3Model(
      No3NaqelEl7araka: '',
      color: '',
      image: '',
      price: '',
      phoneNum: '',
      model3am: '',
      toraz: '',
      location: '',
      model: '',
      elmadena: '',
      uid: '',
    );
  }

  void setCarData() {
    bee3model = Bee3Model(
      No3NaqelEl7araka: no3NaqelEl7rakaController.text,
      elmadena: elmadenaController.text,
      model: modelController.text,
      location: locationController.text,
      toraz: toraztroller.text,
      model3am: model3amController.text,
      price: priceController.text,
      phoneNum: whatsappNamberController.text,
      color: colorController.text,
    );
    emit(SetCarDataLoadingsState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('cars')
        .add(bee3model!.toJson())
        .then((value) {
      emit(SetCarDataSuccessState());
    }).catchError((error) {
      emit(SetCarDataErorrState());
    });
  }

  List<Bee3Model> cars = [];

  void getCars() {
    //cars=[];
    emit(GetCarsDataLoadingsState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('cars')
        .get()
        .then((value) {
      setCarData();
      value.docs.forEach((element) {
        Bee3Model bee3model = Bee3Model.fromJson(element.data());
        cars.add(bee3model);
      });
      emit(GetCarsDataSuccessState());
    }).catchError((erorr) {
      print('getCarsDataError=>${erorr.toString()}');
      emit(GetCarsDataErorrState());
    });
  }

  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  void imagePicker() {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = value;
      uploadProfileImage();
      emit(ImageState());
    });
  }

  void uploadProfileImage() {
    emit(ImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('cars/${Uri.file(imageFile!.path).pathSegments.last}')
        .putFile(File(imageFile!.path))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserInfo(value);
        print(value);
      }).catchError((error) {
        emit(PhotoUrlErrorState());
      });
    }).catchError((error) {
      emit(PhotoErrorState());
    });
  }

  void updateUserInfo(String imageUrl) {
    emit(UpdateImageLoadingState());
    bee3model!.image = imageUrl;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update(userModel!.toMap())
        .then((value) {
      emit(UpdateImageSuccessState());
    }).catchError((error) {
      emit(UpdateImageErrorState());
    });
  }
}
