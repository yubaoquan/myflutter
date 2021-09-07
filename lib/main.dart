import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes/Routes.dart';
import 'utils/Global.dart';

void main() {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  G.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: G.router?.generator,
      initialRoute: '/',
    );
  }
}
