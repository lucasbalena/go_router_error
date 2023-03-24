import 'package:flutter/material.dart';
import 'package:go/router/AppRouter.dart';
import 'package:go/router/AppService.dart';

final router = AppRouter(AppService());

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.router.routeInformationParser,
      routerDelegate: router.router.routerDelegate,
    );
  }
}
