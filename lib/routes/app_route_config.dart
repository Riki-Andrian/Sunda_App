import 'package:Nyunda/Splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Nyunda/routes/app_route_const.dart';
import 'package:Nyunda/ui/aksara_page.dart';
import 'package:Nyunda/ui/home_page.dart';
import 'package:Nyunda/ui/kamus_page.dart';
import 'package:Nyunda/ui/konversi.dart';
import 'package:Nyunda/ui/menulis_page.dart';
import 'package:Nyunda/ui/peribahasa_page.dart';
import 'package:Nyunda/ui/pupuh_page.dart';
import 'package:Nyunda/ui/quiz_menu.dart';
import 'package:Nyunda/ui/translate_page.dart';

class MyAppRouter {
  static GoRouter router() {
    return GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.home,
        path: '/home',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.konversi,
        path: '/konversi',
        pageBuilder: (context, state) {
          return const MaterialPage(child: KonversiPage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.peribahasa,
        path: '/peribahasa',
        pageBuilder: (context, state) {
          return const MaterialPage(child: PeribahasaPage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.kamus,
        path: '/kamus',
        pageBuilder: (context, state) {
          return const MaterialPage(child: KamusPage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.translate,
        path: '/translate',
        pageBuilder: (context, state) {
          return const MaterialPage(child: TranslatePage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.menulis,
        path: '/menulis',
        pageBuilder: (context, state) {
          return MaterialPage(child: Menulis());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.quizmenu,
        path: '/quizmenu',
        pageBuilder: (context, state) {
          return MaterialPage(child: QuizMenu());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.pupuh,
        path: '/pupuhpage',
        pageBuilder: (context, state) {
          return MaterialPage(child: PupuhPage());
        },
      ),
      GoRoute(
        name: MyAppRouterConst.aksara,
        path: '/aksara',
        pageBuilder: (context, state) {
          return MaterialPage(child: AksaraPage());
        },
      ),
    ]);
  }
}
