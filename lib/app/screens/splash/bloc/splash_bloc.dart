// ignore_for_file: constant_identifier_names
import 'package:bloc/bloc.dart';

enum SplashState { InitialState, FinishState, LoadingState }

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState.InitialState);

  Future<void> startTDLibReceiver() async {
    emit(SplashState.LoadingState);
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(SplashState.FinishState);
  }

  void onDonePressed() => emit(SplashState.FinishState);
}
