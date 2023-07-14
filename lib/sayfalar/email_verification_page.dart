import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/ana_sayfa.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _checkEmailVerification(BuildContext context) async {
    User? user = _auth.currentUser;
    await user?.reload();
    user = _auth.currentUser;

    if (user != null && user.emailVerified) {
      // Kullanıcı doğrulandı, kayıt tamamlandı
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AnaSayfa(),
        ),
      );
    } else {
      // Kullanıcı doğrulanamadı

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Doğrulama bekleniyor...',
              style: GoogleFonts.spaceGrotesk(),
            ),
            content: Text(
              'Lütfen E-Posta adresinizi doğrulayın.',
              style: GoogleFonts.indieFlower(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tamam',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'E-Posta Onay',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'E-Posta Adresinizi Doğrulayın',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Text(
                '\'${_auth.currentUser?.email}\' adlı E-Posta adresinize, E-Postanızı doğrulamanız için bir bağlantı gönderildi. Lütfen uygulamayı kapatmadan arka plana alın ve \nE-Postanızı kontrol edip gönderilen bağlantıya tıklayın. Doğruladıktan sonra tekrar buraya gelerek \'Doğrulamayı Kontrol Et\' butonuna basın.',
                style: GoogleFonts.indieFlower(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Doğrulama bekleniyor...',
                style: GoogleFonts.spaceGrotesk(),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(147, 179, 117, 186),
                ),
                onPressed: () => _checkEmailVerification(context),
                child: Text(
                  'Doğrulamayı Kontrol Et',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
