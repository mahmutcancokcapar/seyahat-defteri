import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/auth.dart';

class Gonderilerim extends StatefulWidget {
  const Gonderilerim({super.key});

  @override
  State<Gonderilerim> createState() => _GonderilerimState();
}

// ... (diğer kısımlar)

class _GonderilerimState extends State<Gonderilerim> {
  final User? user = AuthService().currentUser;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('places')
            .where(
              'userEmail',
              isEqualTo: user
                  ?.email, // Sadece giriş yapan kullanıcının e-postasına göre filtreleme
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data!.docs;

          if (documents.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                width: mediaQuery.size.width * 1,
                height: mediaQuery.size.height * 1,
                child: Text(
                  'burasiBos'.tr,
                  style: GoogleFonts.spaceGrotesk(),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var document = documents[index];
              var title = document['title'];

              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  title: Text(
                    title,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        document['userEmail'] +
                            ' ~ ' +
                            document['date'] +
                            '\n' +
                            document['description'],
                        style: GoogleFonts.indieFlower(
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              String googleMapsUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${document['kayitliKonum']}';
                              // ignore: deprecated_member_use
                              if (await canLaunch(googleMapsUrl)) {
                                // ignore: deprecated_member_use
                                await launch(googleMapsUrl);
                              } else {
                                throw 'Google Haritalar açılamadı.';
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_outward_outlined,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
