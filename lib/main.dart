import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:seydef/sayfalar/dil.dart';
import 'package:seydef/sayfalar/splash_screen.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _selectedLocation;
  bool isLocationSelected = false;

  LatLng? get selectedLocation => _selectedLocation;

  void updateLocation(LatLng location) {
    _selectedLocation = location;
    isLocationSelected = true;
    notifyListeners();
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Dil(),
      locale: Get.locale ?? Get.deviceLocale,
      fallbackLocale: Dil.varsayilan,
      debugShowCheckedModeBanner: false,
      title: 'Seyahat Defteri',
      home: const SplashScreen(),
    );
  }
}
