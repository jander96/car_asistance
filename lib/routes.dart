import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => NavHost(),
      )
  ]
  );
