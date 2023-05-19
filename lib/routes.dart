import 'package:car_assistance/src/ui/screens/initialization/init_loading.dart';
import 'package:car_assistance/src/ui/screens/login/login_page.dart';
import 'package:car_assistance/src/ui/screens/login/register_page.dart';
import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      builder: (context, state) => const InitLoading(),
      ),
    GoRoute(
      path: "/",
      builder: (context, state) => const NavHost(),
      ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterPage(),
      )
  ]
  );
