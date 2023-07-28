import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/login_page.dart';
import 'package:seydef/sayfalar/profile_page.dart';

import '../service/auth.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  Future<void> signOut(BuildContext context) async {
    await AuthService().signOut().then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ),
        );
  }

  final User? user = AuthService().currentUser;

  Widget _userUid() {
    return Text(
      user?.email ?? 'User email',
      style: GoogleFonts.indieFlower(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Seyahat Defterim',
              style: GoogleFonts.spaceGrotesk(fontSize: 20),
            ),
            accountEmail: _userUid(),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                'https://cdn.pixabay.com/photo/2020/02/15/16/09/loveourplanet-4851331_1280.jpg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text(
              'profil'.tr,
              style: GoogleFonts.spaceGrotesk(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              'navBarCikis'.tr,
              style: GoogleFonts.spaceGrotesk(),
            ),
            onTap: () async {
              await signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
