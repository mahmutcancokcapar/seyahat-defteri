import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../service/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController remailController = TextEditingController();
  TextEditingController rpasswordController = TextEditingController();

  String? errorMessage = '';

  Future<void> createUser() async {
    try {
      await Auth().createUser(
        email: remailController.text,
        password: rpasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Seyahat\nDefterinize',
              style: GoogleFonts.indieFlower(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'HOŞGELDİNİZ!',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 50,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: remailController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.indieFlower(),
              decoration: InputDecoration(
                labelText: 'E-mail adresiniz',
                focusColor: Colors.black,
                labelStyle: GoogleFonts.indieFlower(
                  color: const Color.fromARGB(255, 130, 126, 126),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: rpasswordController,
              obscureText: true,
              style: GoogleFonts.indieFlower(),
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'Şifreniz',
                focusColor: Colors.black,
                labelStyle: GoogleFonts.indieFlower(
                  color: const Color.fromARGB(255, 130, 126, 126),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                createUser();
              },
              child: Text(
                'Kayıt Ol',
                style: GoogleFonts.spaceGrotesk(fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Zaten bi hesabınız mı var?',
                  style: GoogleFonts.indieFlower(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Giriş Yap',
                    style: GoogleFonts.indieFlower(
                        color: Colors.blue, fontSize: 15),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
