import 'package:carshop/modules/bee3/cubit/cubit.dart';
import 'package:carshop/modules/login/cubit/cubit.dart';
import 'package:carshop/modules/lotie.dart';
import 'package:carshop/modules/new_cars/cubit/cubit.dart';
import 'package:carshop/modules/register/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'companats/file_companates.dart';
import 'modules/DetailsScreen/DetailsCubit/cubit.dart';
import 'modules/DetailsScreen/pegas/cubit/cubit.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp()
      .then((value) => {print('firebase initialized successfully')})
      .catchError((error) {
    print('firebase initialized error=>${error.toString()}');
  });
  runApp(MyApp(
    saveUser: user,
  ));
  Bloc.observer = MyBlocObserver();
  user = FirebaseAuth.instance.currentUser;
}

class MyApp extends StatelessWidget {
  User? saveUser;

  MyApp({
    required this.saveUser,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => NewCarsCubit()..getNewCarsData(),
        ),
        BlocProvider(
          create: (context) => Bee3Cubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
        BlocProvider(
          create: (context) => PegasDetailsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
