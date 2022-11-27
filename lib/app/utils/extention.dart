import 'package:flutter/material.dart';

dynamic push(BuildContext context, Widget newPage, [Object? args]) {
  return Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => newPage,
      settings: RouteSettings(arguments: args),
    ),
  );
}

dynamic pop(BuildContext context, Widget newPage, [dynamic result]) {
  return Navigator.pop(context, result);
}

dynamic pushReplacement(BuildContext context, Widget newPage, [Object? args]) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute<void>(
      builder: (context) => newPage,
      settings: RouteSettings(arguments: args),
    ),
  );
}
