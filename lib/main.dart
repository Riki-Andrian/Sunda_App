import 'package:flutter/material.dart';
import 'package:sunda_app/routes/app_route_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: MyAppRouter.router(),
    );
  }
}
