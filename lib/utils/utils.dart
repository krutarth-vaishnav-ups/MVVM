
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusNode(BuildContext context, FocusNode currentFocusNode, FocusNode nextFocusNode) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
      toastLength: Toast.LENGTH_SHORT
    );
  }

  static void flushBarSuccessMessage(BuildContext context, String message){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          // title: 'SAD',
          // titleColor: Colors.white,
          message: message,
          messageColor: Colors.white,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.check_circle, size: 18, color: Colors.white,),
        )..show(context)
    );
  }

  static void flushBarErrorMessage(BuildContext context, String message){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          // title: 'SAD',
          // titleColor: Colors.white,
          message: message,
          messageColor: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.error, size: 18, color: Colors.white,),
        )..show(context)
    );
  }

  static snackBar(BuildContext context, String message){
    return ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message)
      )
    );
  }
}