import 'package:flutter/material.dart';
class EnqazScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.orange,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/enqaz.jpg'),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '01276192726',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25.0,
          ),
          ),
        ],
      ),
    );
  }
}
