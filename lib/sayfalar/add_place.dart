import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    String userEmail = user?.email ?? 'User email'; //changed

    final locationProvider = Provider.of<LocationProvider>(context);

    final LatLng? selectedLocation = locationProvider.selectedLocation;

    String kayitliKonum = '${selectedLocation?.latitude}' +
        ', ' +
        '${selectedLocation?.longitude}';

    void _onButtonPressed() {
      if (isButtonEnabled) {
        addPlace(
          title: baslikController.text,
          description: aciklamaController.text,
          date: date1,
          userEmail: userEmail,
          kayitliKonum: kayitliKonum,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void _checkButtonstate() {
      setState(
        () {
          if (baslikController.text.isNotEmpty &&
              aciklamaController.text.isNotEmpty) {
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
            icon: Icon(
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
                Container(
                  child: Padding(
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
                                              '${selectedLocation.latitude}' +
                                                  ',' +
                                                  '${selectedLocation.longitude}',
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
                          onChanged: (value) => _checkButtonstate(),
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
                          onChanged: (value) => _checkButtonstate(),
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
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        147, 179, 117, 186),
                                  ),
                                  onPressed: isButtonEnabled &&
                                          locationProvider.isLocationSelected
                                      ? _onButtonPressed
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future addPlace({
    required String title,
    required String description,
    required String date,
    required String userEmail,
    required String kayitliKonum,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userEmail = user.email ?? 'User email';

      final docPlace = FirebaseFirestore.instance.collection('places').doc();
      final places = Places(
        description: aciklamaController.text,
        title: baslikController.text,
        date: date1,
        userEmail: userEmail,
        id: docPlace.id,
        kayitliKonum: kayitliKonum,
      );

      final json = places.toJson();

      await docPlace.set(json);
    }
  }
}
