import 'package:go_router/go_router.dart';
import 'package:t_file/app/screens/login/login.dart';
import 'package:t_file/app/screens/splash/splash.dart';

class Routes {
  static final routes = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}
