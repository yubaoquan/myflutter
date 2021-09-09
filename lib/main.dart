import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes/Routes.dart';
import 'utils/Global.dart';
import 'package:provider/provider.dart';
import 'providers/CurrentIndexProvider.dart';
import 'providers/CategoryProvider.dart';
import 'providers/NewsProvider.dart';

void main() {
  FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  G.router = router;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CurrentIndexProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: NewsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: G.router.generator,
      initialRoute: '/',
    );
  }
}
