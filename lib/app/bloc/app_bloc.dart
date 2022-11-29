import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<Locale> {
  AppBloc() : super(Locale("en"));

  void changeLocal(String locale) {
    emit(Locale(locale));
  }
}
