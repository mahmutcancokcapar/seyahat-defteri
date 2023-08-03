import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seydef/google_map.dart';
import 'package:seydef/service/auth.dart';
import '../main.dart';
import '../service/places_class.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  // ignore: unused_field
  final Completer<GoogleMapController> _controller = Completer();
  TextEditingController baslikController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  String date1 = DateFormat('dd/MM/yyyy - hh:mm aaa').format(DateTime.now());
  FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = AuthService().currentUser; //changed
  bool isButtonEnabled = false;
  bool _isToggled = false;

  void toggleButton() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  final snackBar = SnackBar(
    content: Text('snackBarContent'.tr),
    action: SnackBarAction(label: 'snackBarAction'.tr, onPressed: () {}),
  );

  @override
  void dispose() {
    baslikController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  String? selectedValue;
  InterstitialAd? _interstitialAd;
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId:
          "ca-app-pub-7677750212299055/2054180324", //  ca-app-pub-3940256099942544/1033173712
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          // ignore: avoid_print
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  List<String> sehirler = [
    'Adana',
    'Adıyaman',
    'Afyonkarahisar',
    'Ağrı',
    'Amasya',
    'Ankara',
    'Antalya',
    'Artvin',
    'Aydın',
    'Balıkesir',
    'Bilecik',
    'Bingöl',
    'Bitlis',
    'Bolu',
    'Burdur',
    'Bursa',
    'Çanakkale',
    'Çankırı',
    'Çorum',
    'Denizli',
    'Diyarbakır',
    'Edirne',
    'Elazığ',
    'Erzincan',
    'Erzurum',
    'Eskişehir',
    'Gaziantep',
    'Giresun',
    'Gümüşhane',
    'Hakkari',
    'Hatay',
    'Isparta',
    'Mersin',
    'İstanbul',
    'İzmir',
    'Kars',
    'Kastamonu',
    'Kayseri',
    'Kırklareli',
    'Kırşehir',
    'Kocaeli',
    'Konya',
    'Kütahya',
    'Malatya',
    'Manisa',
    'Kahramanmaraş',
    'Mardin',
    'Muğla',
    'Muş',
    'Nevşehir',
    'Niğde',
    'Ordu',
    'Rize',
    'Sakarya',
    'Samsun',
    'Siirt',
    'Sinop',
    'Sivas',
    'Tekirdağ',
    'Tokat',
    'Trabzon',
    'Tunceli',
    'Şanlıurfa',
    'Uşak',
    'Van',
    'Yozgat',
    'Zonguldak',
    'Aksaray',
    'Bayburt',
    'Karaman',
    'Kırıkkale',
    'Batman',
    'Şırnak',
    'Bartın',
    'Ardahan',
    'Iğdır',
    'Yalova',
    'Karabük',
    'Kilis',
    'Osmaniye',
    'Düzce',
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = sehirler[0];
    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    String userEmail = user?.email ?? 'User email'; //changed

    final locationProvider = Provider.of<LocationProvider>(context);

    final LatLng? selectedLocation = locationProvider.selectedLocation;

    String kayitliKonum =
        '${selectedLocation?.latitude}, ${selectedLocation?.longitude}';

    void onButtonPressed() {
      if (_isToggled) {
        addData(
            collection: 'ozel',
            title: baslikController.text,
            description: aciklamaController.text,
            date: date1,
            userEmail: userEmail,
            kayitliKonum: kayitliKonum,
            sehir: selectedValue);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        addData(
            collection: 'places',
            title: baslikController.text,
            description: aciklamaController.text,
            date: date1,
            userEmail: userEmail,
            kayitliKonum: kayitliKonum,
            sehir: selectedValue);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void showInterstitialAdThenSubmit() {
      if (_interstitialAd != null) {
        _interstitialAd!.show();

        _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            onButtonPressed(); // Reklam kapatıldıktan sonra, işlemi tamamlamak için _onButtonPressed metodunu çağırın.
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            // ignore: avoid_print
            print('InterstitialAd failed to show full screen content: $error');
            onButtonPressed(); // Reklam gösterilemediğinde de işlemi tamamlamak için _onButtonPressed metodunu çağırın.
          },
        );

        _interstitialAd =
            null; // Reklamın tekrar kullanılabilmesi için referansı boşaltın
      } else {
        // Reklam yüklenmediyse, yine de işlemi tamamlayabiliriz
        onButtonPressed();
      }
    }

    void checkButtonstate() {
      setState(
        () {
          if (baslikController.text.isNotEmpty &&
              aciklamaController.text.isNotEmpty &&
              selectedValue.toString().isNotEmpty) {
            isButtonEnabled = true;
          } else {
            isButtonEnabled = false;
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'addPlaceAppBar'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'uyari'.tr,
                      style: GoogleFonts.spaceGrotesk(),
                    ),
                    content: Text(
                      'gizlilik'.tr,
                      style: GoogleFonts.indieFlower(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'registerDialog3'.tr,
                          style: GoogleFonts.spaceGrotesk(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.question_mark_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            width: mediaQuery.size.width * 0.89,
            height: mediaQuery.size.height * 0.3,
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: const Color.fromARGB(147, 179, 117, 186),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Map(),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'koordinat'.tr,
                                style: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    // ignore: unnecessary_null_comparison
                                    selectedLocation != null
                                        ? Text(
                                            '${selectedLocation.latitude},${selectedLocation.longitude}',
                                            style: GoogleFonts.spaceGrotesk(),
                                          )
                                        : Text(
                                            'konumSec'.tr,
                                            style: GoogleFonts.spaceGrotesk(),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        date1,
                        style: GoogleFonts.spaceGrotesk(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) => checkButtonstate(),
                        controller: baslikController,
                        maxLines: 1,
                        maxLength: 50,
                        style: GoogleFonts.spaceGrotesk(),
                        decoration: InputDecoration(
                          labelText: 'addPlaceBaslik'.tr,
                          border: const OutlineInputBorder(),
                          focusColor: Colors.black,
                          labelStyle: GoogleFonts.indieFlower(
                            color: const Color.fromARGB(255, 130, 126, 126),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) => checkButtonstate(),
                        controller: aciklamaController,
                        maxLines: 1,
                        maxLength: 3000,
                        style: GoogleFonts.spaceGrotesk(),
                        decoration: InputDecoration(
                          labelText: 'addPlaceAciklama'.tr,
                          border: const OutlineInputBorder(),
                          focusColor: Colors.black,
                          labelStyle: GoogleFonts.indieFlower(
                            color: const Color.fromARGB(255, 130, 126, 126),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          items: sehirler.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          value: selectedValue,
                        ),
                      ),
                      const Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 285,
                                    height: 20,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        _isToggled
                                            ? 'gizli'.tr
                                            : 'herkeseAcik'.tr,
                                        style: GoogleFonts.spaceGrotesk(
                                          color: _isToggled
                                              ? Colors.red
                                              : Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Switch(
                                activeColor: Colors.red,
                                value: _isToggled,
                                onChanged: (value) {
                                  toggleButton();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(147, 179, 117, 186),
                                ),
                                onPressed: isButtonEnabled &&
                                        locationProvider.isLocationSelected
                                    ? showInterstitialAdThenSubmit
                                    : null,
                                child: Text(
                                  '$userEmail\n${'addPlaceButton'.tr}', // changed
                                  style: GoogleFonts.spaceGrotesk(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addData({
    required String collection,
    required String title,
    required String description,
    required String date,
    required String userEmail,
    required String kayitliKonum,
    required String? sehir,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userEmail = user.email ?? 'User email';

      final docPlace = FirebaseFirestore.instance.collection(collection).doc();
      final places = Places(
        description: aciklamaController.text,
        title: baslikController.text,
        date: date1,
        userEmail: userEmail,
        id: docPlace.id,
        kayitliKonum: kayitliKonum,
        sehir: selectedValue.toString(),
      );

      final json = places.toJson();

      await docPlace.set(json);
    }
  }
}
