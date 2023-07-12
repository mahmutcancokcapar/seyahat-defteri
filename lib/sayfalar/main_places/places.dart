import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/discover_page.dart';
import 'package:seydef/sayfalar/main_places/favorite_places.dart';
import 'package:seydef/sayfalar/navbar.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: controller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueGrey,
          labelStyle: GoogleFonts.spaceGrotesk(),
          indicatorColor: Colors.black,
          tabs: const [
            Tab(
              text: 'Tüm Yerler',
            ),
            Tab(
              text: 'Favori Yerlerim',
            ),
          ],
        ),
      ),
      drawer: NavBar(),
      body: TabBarView(
        controller: controller,
        children: const [
          Discover(),
          FavoritePlaces(),
        ],
      ),
    );
  }
}
