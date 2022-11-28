import 'package:flutter/material.dart';

void customSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
