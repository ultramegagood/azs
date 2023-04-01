///создание путей для работы с АПП
import 'package:azs/assets.dart';
import 'package:azs/detailPage.dart';
import 'package:azs/login_page.dart';
import 'package:azs/main.dart';
import 'package:azs/qr_page.dart';
import 'package:azs/service_locator.dart';
import 'package:azs/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';
import 'home_page.dart';
///
///роутер чтоб задать маршруты и подмаршруты используется пакет go_router
///

GoRouter routes = GoRouter(
  initialLocation: '/auth',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/auth",
      builder: (context, state) => const LoginPage(),
      redirect: (context, state){
        if(FirebaseAuth.instance.currentUser != null){
          return "/";
        }
      }
    ),

    GoRoute(
      path: "/signup",
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(path: '/', builder: (context, state) => MyHome(), routes: [
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

///
/// Логгер чтобы выводить касивые логи на консоль
///
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 30,
    errorMethodCount: 5,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
