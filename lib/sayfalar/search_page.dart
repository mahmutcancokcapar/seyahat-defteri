import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';
  List<DocumentSnapshot> _searchResults = [];
  String userUID = ''; // Kullanıcının UID'sini burada tanımlayın

  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  Future<void> _search() async {
    if (_searchQuery.trim().isEmpty) return;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('places')
        .where('title', isEqualTo: searchController.text)
        .get();

    setState(() {
      _searchResults = snapshot.docs;
    });
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId:
          "ca-app-pub-7677750212299055/5128487105", // Reklam birimi kimliği
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // ignore: avoid_print
          print('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    _bannerAd!.load();
  }

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'searchPageAppBar'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // Bu kısmı ekledik
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                textAlign: TextAlign.center,
                controller: searchController,
                maxLines: 1,
                maxLength: 50,
                style: GoogleFonts.spaceGrotesk(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _search,
                  ),
                  labelText: 'aramaGir'.tr,
                  focusColor: Colors.black,
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap:
                  true, // ListView'ın boyutunu içindeki elemanlara göre ayarlamak için
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = _searchResults[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    title: Text(
                      document['title'],
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
            ),
            if (_isBannerAdLoaded)
              SizedBox(
                height: 50, // Reklamın yüksekliği
                child: AdWidget(ad: _bannerAd!),
              ),
          ],
        ),
      ),
    );
  }
}
