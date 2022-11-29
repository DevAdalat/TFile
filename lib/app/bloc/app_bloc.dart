import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_file/app/database/app_database.dart';

class AppBloc extends Cubit<Locale> {
  AppBloc() : super(Locale(TFileDB.getLocal));

  void changeLocal(String locale) async {
    TFileDB.saveLocal = locale;
    emit(Locale(locale));
  }
}
