import 'package:go_router/go_router.dart';
import 'package:nextdeal_app/screens/home_screen.dart';
import 'package:nextdeal_app/screens/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/splash",
        name: "/splash",
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: "/home",
        name: "/home",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child,
            child: HomeScreen(),
            transitionDuration: Duration(milliseconds: 600),
          );
        },
      ),
    ],
  );
}
