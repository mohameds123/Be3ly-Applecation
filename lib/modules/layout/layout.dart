import 'package:carshop/modules/ENQAZ.dart';
import 'package:carshop/modules/bee3/bee3.dart';
import 'package:carshop/modules/login/login_screen.dart';
import 'package:carshop/modules/new_cars/newcars.dart';
import 'package:carshop/modules/used_cars/usedcars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Bee3Layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: MaterialButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context)=>Bee3Screen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'بيع سيارتك',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context)=>NewCarsScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://www.clipartkey.com/mpngs/m/74-747858_sports-car-luxury-vehicle-clip-art-sports-cars.png',
                          ),
                          Text(
                            'سيارات جديدة',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context)=>UsedCars(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://tse3.mm.bing.net/th?id=OIP.dwlTjKzugyOPYKTxSQlYaAHaE7&pid=Api&P=0&w=229&h=153',
                          ),
                          Text(
                            'سيارات مستعملة',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 250.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: MaterialButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context)=>EnqazScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'خدمة الانقاذ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
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
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>LoginScreen(),
                      ),
                          (route) => false
                  );
                },
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}