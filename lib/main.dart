import 'package:data_heros_test/config/init_app.dart';
import 'package:data_heros_test/config/routes.dart';
import 'package:data_heros_test/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  Init_app();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'tajwal'),
      locale: Locale('ar'),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}
