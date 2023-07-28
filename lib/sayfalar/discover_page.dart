import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/navbar.dart';
import 'package:seydef/sayfalar/see_place.dart';
import 'place_card.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  String? userUID;

  @override
  void initState() {
    super.initState();
    // Kullanıcının UID'sini alın
    _getUserUID();
  }

  Future<void> _getUserUID() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        userUID = currentUser.uid;
      });
    }
  }

  Future _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'addPlaceAppBar'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        'yeniYerAciklama'.tr,
                        style: GoogleFonts.indieFlower(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _showBottomSheet2(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'discoverPageAppBar'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        'kesfetAciklama'.tr,
                        style: GoogleFonts.indieFlower(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _showBottomSheet3(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'searchPageAppBar'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        'searchAciklama'.tr,
                        style: GoogleFonts.indieFlower(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _showBottomSheet4(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'bizeUlas'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        'bizeUlasPageAciklama'.tr,
                        style: GoogleFonts.indieFlower(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _showBottomSheet5(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'profilPage'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        'profilPageAciklama'.tr,
                        style: GoogleFonts.indieFlower(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'discoverPageAppBar'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'nasilKullanilir'.tr,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _showBottomSheet2(context);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.donut_small_outlined, size: 50, color: Colors.deepPurple,),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'discoverPageAppBar'.tr,
                                style: GoogleFonts.spaceGrotesk(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet(context);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.add, size: 50, color: Colors.deepPurple,),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.deepPurple),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'addPlaceAppBar'.tr,
                                style: GoogleFonts.spaceGrotesk(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet3(context);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.search, size: 50,color: Colors.deepPurple,),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'searchPageAppBar'.tr,
                                style: GoogleFonts.spaceGrotesk(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet4(context);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.contact_support_outlined, size: 50, color: Colors.deepPurple,),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'bizeUlas'.tr,
                                style: GoogleFonts.spaceGrotesk(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet5(context);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person_outline_rounded, size: 50, color: Colors.deepPurple,),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'profil'.tr,
                                style: GoogleFonts.spaceGrotesk(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
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
                    final placesList = snapshot.data!.docs;
                    return GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: placesList
                          .map<Widget>((place) => PlaceCard(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SeePlace(
                                        doc: place,
                                      ),
                                    ),
                                  );
                                },
                                doc: place,
                                userUID: userUID ?? '',
                              ))
                          .toList(),
                    );
                  }
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
