import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:t_file/app/screens/home/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.InitialHomeState) {
    scrollController.addListener(scrollListener);
  }
  final scrollController = ScrollController();
  void handleFabExpantion() {
    if (scrollController.position.pixels >
        (scrollController.position.maxScrollExtent * 0.15)) {
      emit(HomeState.FabExpandState);
    } else {
      emit(HomeState.FabCollpasedState);
    }
  }

  void scrollListener() {
    handleFabExpantion();
  }
}
