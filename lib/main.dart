import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Nyunda/data/model/hasil.dart';
import 'package:Nyunda/routes/app_route_config.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[250]
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: MyAppRouter.router(),
    );
  }
}
