import 'package:flutter/material.dart';
import 'package:t_file/app/app.dart';
import 'package:t_file/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
