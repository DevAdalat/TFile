import 'package:bloc/bloc.dart';
import 'package:t_file/app/screens/home/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.InitialHomeState);
}
