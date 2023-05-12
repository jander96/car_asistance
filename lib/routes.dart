import 'package:car_assistance/src/ui/screens/login/login_page.dart';
import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => NavHost(),
      ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginPage(),
      )
  ]
  );
