import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sunda_app/data/model/hasil.dart';
import 'package:sunda_app/routes/app_route_config.dart';

import 'helper/boxes.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(HasilAdapter());
  boxHasil = await Hive.openBox<Hasil>('hasilBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouter.router(),
    );
  }
}
