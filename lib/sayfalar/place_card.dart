import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceCard extends StatefulWidget {
  final Function()? onTap;
  final QueryDocumentSnapshot doc;
  final String userUID; // User UID'yi almak için parametre olarak ekledik

  const PlaceCard(
      {super.key,
      required this.onTap,
      required this.doc,
      required this.userUID});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  void _openInGoogleMaps() async {
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${widget.doc['kayitliKonum']}';
    // ignore: deprecated_member_use
    if (await canLaunch(googleMapsUrl)) {
      // ignore: deprecated_member_use
      await launch(googleMapsUrl);
    } else {
      throw 'Google Haritalar açılamadı.';
    }
  }

  bool isFavorite = false;

  void _toggleFavorite() async {
    final docRef =
        FirebaseFirestore.instance.collection('places').doc(widget.doc.id);

    // Firestore'dan alınan belgedeki veriyi bir map olarak alıyoruz
    Map<String, dynamic>? data = widget.doc.data() as Map<String, dynamic>?;

    // Veriyi kontrol ediyoruz ve "favoriteBy" alanı yoksa oluşturuyoruz
    if (data != null && !data.containsKey('favoriteBy')) {
      await docRef.set({'favoriteBy': []}, SetOptions(merge: true));
    }

    // "favoriteBy" alanını güncellemek için belgedeki veriyi tekrar alıyoruz
    data = widget.doc.data() as Map<String, dynamic>?;

    // "favoriteBy" alanını alınan belgedeki veri türüne uygun bir liste olarak alıyoruz
    List<dynamic>? favorites = data?['favoriteBy'];

    // "favorites" listesini String tipinde bir liste haline getiriyoruz
    List<String> stringFavorites = favorites?.cast<String>() ?? [];

    if (stringFavorites.contains(widget.userUID)) {
      // Eğer kullanıcının UID'si zaten favorilerde ise, favorilerden çıkar
      stringFavorites.remove(widget.userUID);
    } else {
      // Değilse, favorilere ekle
      stringFavorites.add(widget.userUID);
    }

    // "favoriteBy" alanını güncelle
    await docRef.update({'favoriteBy': stringFavorites});

    setState(() {
      isFavorite = stringFavorites.contains(widget.userUID);
    });
  }

  @override
  void initState() {
    super.initState();
    // "favoriteBy" alanındaki kullanıcının UID'sinin favorilerde olup olmadığını kontrol et
    Map<String, dynamic>? data = widget.doc.data() as Map<String, dynamic>?;

    if (data != null && data.containsKey('favoriteBy')) {
      List<dynamic>? favorites = data['favoriteBy'];
      List<String> stringFavorites = favorites?.cast<String>() ?? [];
      isFavorite = stringFavorites.contains(widget.userUID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 10,
        height: 20,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(146, 236, 196, 241),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                widget.doc['title'],
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: _openInGoogleMaps,
                          icon: const Icon(Icons.arrow_outward_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Divider(),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        widget.doc['description'],
                        style: GoogleFonts.indieFlower(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Divider(),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      child: Text(
                        widget.doc['userEmail'],
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      child: Text(
                        widget.doc['date'],
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
