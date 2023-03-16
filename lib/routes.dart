///создание путей для работы с АПП
import 'package:azs/detailPage.dart';
import 'package:azs/main.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) =>  MyHome(), routes: [
      GoRoute(
          path: "qr",
          builder: (context, state) => const QRViewExample(),
          routes: [
            GoRoute(
              path: "result",
              builder: (context, state) => const DetailPage(),
            ),
          ]),
    ]),
  ],
);
