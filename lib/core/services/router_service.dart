import 'package:go_router/go_router.dart';
import '../../app/home/views/pages/main_screen.dart';

class RouterService {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
