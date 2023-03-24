import 'package:go/router/AppService.dart';
import 'package:go/router/route_utils.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/singup_page.dart';

class AppRouter {
  final AppService appService;
  AppRouter(this.appService);
  GoRouter get router => _goRouter;

  late final _goRouter = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: APP_PAGE.login.toPath,
      routes: [
        GoRoute(
          path: APP_PAGE.home.toPath,
          name: APP_PAGE.home.toName,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: APP_PAGE.login.toPath,
          name: APP_PAGE.login.toName,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: APP_PAGE.singup.toPath,
          name: APP_PAGE.singup.toName,
          builder: (context, state) => const SingupPage(),
        ),
      ],
      refreshListenable: appService,
      redirect: (context, state) {
        final homeLocation = //APP_PAGE.home.toName;
            state.namedLocation(APP_PAGE.home.toPath);
        final loginLocation = //APP_PAGE.login.toName;
            state.namedLocation(APP_PAGE.login.toPath);
        final singupLocation = //APP_PAGE.singup.toName;
            state.namedLocation(APP_PAGE.singup.toPath);

        final isLogedIn = appService.loginState;

        if (isLogedIn) {
          return homeLocation;
        } else {
          return loginLocation;
        }
      });
}
