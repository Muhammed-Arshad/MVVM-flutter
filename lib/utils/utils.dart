import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static void fieldFocusChange(
      BuildContext context,
      FocusNode currFocus,
      FocusNode nextFocus
      ){
    currFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  static void flushBarErrorMsg(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(8),
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 28,color: Colors.white,),
        )..show(context));
  }

  static snackBar(BuildContext context, String message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message))
    );
  }

}