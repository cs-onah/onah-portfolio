import 'package:go_router/go_router.dart';
import 'package:onah_portfolio/core/constants/route_names.dart';
import 'package:onah_portfolio/ui/features/home/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
