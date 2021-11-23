import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
User?user;
void navigateAndFinish({
  context,
  widget,
}){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=>widget,
      ),
          (route) => false
  );
}


class DefaultButton extends StatelessWidget {
  Function function;
  double width;
  String text;
  double height;
  DefaultButton({
    required this.function,
    required this.text,
    required this.height,
    this.width = double.infinity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class DefaultFormField extends StatelessWidget
{
  TextEditingController controller;
  String lable;
  IconData prefix;
  TextInputType type;
  FormFieldValidator<String>validator;
  DefaultFormField({
    required this.prefix,
    required this.lable,
    required this.controller,
    required this.type,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        //color: Colors.white,
      ),
      validator:validator,
      keyboardType: type,
      controller:controller,
      decoration: InputDecoration(
        // labelStyle: TextStyle(
        //   color: Colors.white
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30.0)
        ),
        labelText: lable,
        prefixIcon: Icon(prefix),
      ),
    );
  }
}
