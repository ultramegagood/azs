///создание путей для работы с АПП
import 'package:azs/detailPage.dart';
import 'package:azs/main.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

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

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 30,
    errorMethodCount: 5,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
