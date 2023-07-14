import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/navbar.dart';
import 'package:seydef/sayfalar/place_card.dart';
import 'package:seydef/sayfalar/see_place.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _Discover();
}

class _Discover extends State<Discover> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('places');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keşfet',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('places').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map(
                            (place) => placeCard(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeePlace(
                                    doc: place,
                                  ),
                                ),
                              );
                            }, place),
                          )
                          .toList(),
                    );
                  }
                  return const Text(
                    'Burası şimdilik boş',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
