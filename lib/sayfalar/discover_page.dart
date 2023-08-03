import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

  Future<void> _getUserUID() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        userUID = currentUser.uid;
      });
    }
  }

  String? selectedValue;

  List<String> sehirler = [
    'MC MEDYA',
    'Ankara',
    'İstanbul',
    'Gaziantep',
    'Adana',
    'Adıyaman',
    'Afyonkarahisar',
    'Ağrı',
    'Amasya',
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
    'Giresun',
    'Gümüşhane',
    'Hakkari',
    'Hatay',
    'Isparta',
    'Mersin',
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

  // Banner reklam için değişken tanımlamaları
  late BannerAd _bannerAd;

  // Banner reklamı oluşturmak için metod
  void _createBannerAd() {
    const adUnitId =
        "ca-app-pub-7677750212299055/5128487105"; //ca-app-pub-3940256099942544/6300978111
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: adUnitId,
      listener: BannerAdListener(onAdLoaded: (_) {
        // ignore: avoid_print
        print("Banner Ad loaded");
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // ignore: avoid_print
        print("Banner Ad failed to load: $error");
      }),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _getUserUID();
    selectedValue = sehirler[0];
    _createBannerAd();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId:
          "ca-app-pub-7677750212299055/2054180324", // ca-app-pub-3940256099942544/1033173712
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          // ignore: avoid_print
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  InterstitialAd? _interstitialAd;

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Divider(),
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Divider(),
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Divider(),
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Divider(),
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Divider(),
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
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(
                                Icons.donut_small_outlined,
                                size: 40,
                                color: Colors.deepPurple,
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
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.deepPurple,
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
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet3(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(
                                Icons.search,
                                size: 40,
                                color: Colors.deepPurple,
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
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet4(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(
                                Icons.contact_support_outlined,
                                size: 40,
                                color: Colors.deepPurple,
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
                      const VerticalDivider(),
                      InkWell(
                        onTap: () {
                          _showBottomSheet5(context);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(
                                Icons.person_outline_rounded,
                                size: 40,
                                color: Colors.deepPurple,
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
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: SizedBox(
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
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('places')
                    .where('sehir', isEqualTo: selectedValue.toString())
                    .snapshots(),
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
                                  if (_interstitialAd != null) {
                                    _interstitialAd!.show();
                                    _interstitialAd!.fullScreenContentCallback =
                                        FullScreenContentCallback(
                                      onAdDismissedFullScreenContent: (ad) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SeePlace(
                                              doc: place,
                                            ),
                                          ),
                                        );
                                        _loadInterstitialAd(); // Yeni bir reklam yüklemek için
                                      },
                                      onAdFailedToShowFullScreenContent:
                                          (ad, error) {
                                        // ignore: avoid_print
                                        print(
                                            'InterstitialAd failed to show full screen content: $error');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SeePlace(
                                              doc: place,
                                            ),
                                          ),
                                        );
                                        _loadInterstitialAd(); // Yeni bir reklam yüklemek için
                                      },
                                    );
                                    _interstitialAd =
                                        null; // Reklamın tekrar kullanılabilmesi için referansı boşaltın
                                  }
                                },
                                doc: place,
                                userUID: userUID ?? '',
                              ))
                          .toList(),
                    );
                  } else {
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
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          ],
        ),
      ),
    );
  }
}
