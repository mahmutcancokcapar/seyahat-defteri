import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seydef/sayfalar/dil.dart';
import 'package:seydef/service/widget_tree.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Dil(),
      locale: Get.locale ?? Get.deviceLocale,
      fallbackLocale: Dil.varsayilan,
      debugShowCheckedModeBanner: false,
      title: 'Seyahat Defterim',
      home: const WidgetTree(),
    );
  }
}
