import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    ///this is a short message pop on the screen it show different messages.we can set the message
    Fluttertoast.showToast(
        msg: message,
        fontSize: 20,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  }

  static flushBar(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(30),
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 1),

        ///if we will not give it duration it will not disapear
        message: message,
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    ///build context is used to give position of widget in the widget tree
    return ScaffoldMessenger.of(context)
        .showSnackBar(snackBar(message, context));
  }

  static focusChange(

      /// when one text form will be completed or done then it will move us to the next text form field
      BuildContext context,
      FocusNode current,
      FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }
}
