import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seydef/google_map.dart';
import 'package:seydef/service/auth.dart';
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
  final User? user = Auth().currentUser; //changed
  bool isButtonEnabled = false;

  final snackBar = SnackBar(
    content: const Text('Başarıyla paylaşıldı!'),
    action: SnackBarAction(label: 'Tamam', onPressed: () {}),
  );

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
    void _onButtonPressed() {
      if (isButtonEnabled) {
        addPlace(
          title: baslikController.text,
          description: aciklamaController.text,
          date: date1,
          userEmail: userEmail,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yeni Bir Yer Ekleyin',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
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
                      labelText: "Başlık...",
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
                      labelText: "Bir açıklama ekleyebilirsiniz...",
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
                              backgroundColor:
                                  const Color.fromARGB(147, 179, 117, 186),
                            ),
                            onPressed:
                                isButtonEnabled ? _onButtonPressed : null,
                            child: Text(
                              '$userEmail olarak paylaş', // changed
                              style: GoogleFonts.spaceGrotesk(),
                              overflow: TextOverflow.ellipsis,
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
    );
  }

  Future addPlace({
    required String title,
    required String description,
    required String date,
    required String userEmail,
  }) async {
    // Reference to document
    final docPlace = FirebaseFirestore.instance.collection('places').doc();

    final places = Places(
      description: aciklamaController.text,
      title: baslikController.text,
      date: date1,
      userEmail: userEmail,
      id: docPlace.id,
    );

    final json = places.toJson();

    // Create document and write data to Firebase
    await docPlace.set(json);
  }
}
