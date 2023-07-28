import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/gonderilerim_page.dart';
import 'package:seydef/sayfalar/main_places/favorite_places.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _ProfilPageState extends State<ProfilPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String userEmail = '';
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email!;
      });
    } else {
      print('Kullanıcı oturumu açmamış.');
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'profil'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        userEmail,
                        style: GoogleFonts.indieFlower(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 50,
            child: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.view_comfy_alt_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Gonderilerim(),
                FavoritePlaces(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
