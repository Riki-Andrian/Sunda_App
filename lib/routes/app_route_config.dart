import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:sunda_app/data/model/quiz.dart';
import 'package:sunda_app/routes/app_route_const.dart';
import 'package:sunda_app/ui/home_page.dart';
import 'package:sunda_app/ui/kamus_page.dart';
import 'package:sunda_app/ui/konversi.dart';
import 'package:sunda_app/ui/menulis_page.dart';
import 'package:sunda_app/ui/peribahasa_page.dart';
import 'package:sunda_app/ui/pupuh_page.dart';
import 'package:sunda_app/ui/quiz_menu.dart';
// import 'package:sunda_app/ui/quiz_page.dart';
import 'package:sunda_app/ui/translate_page.dart';

class MyAppRouter {
  static GoRouter router() {
    return GoRouter(initialLocation: '/', routes: [
      GoRoute(
        name: MyAppRouterConst.home,
        path: '/',
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
      // GoRoute(
      // name: MyAppRouterConst.quizpage,
      // path: '/quizpage',
      // pageBuilder: (context, state) {
      //   return MaterialPage(child: QuizPage(level: level));
      // },
      // ),
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
    ]);
  }

  // GoRouter router = GoRouter(
  //   initialLocation: '/',
  //   routes: [
  //     GoRoute(
  //       name: MyAppRouterConst.home,
  //       path: '/',
  //       builder: (context, state) => const HomePage(),
  //     ),
  //     GoRoute(
  //       name: MyAppRouterConst.konversi,
  //       path: '/konversi',
  //       builder: (context, state) => const KonversiPage(),
  //       )
  //   ]
  // );
}
