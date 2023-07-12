import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/register.dart';

import '../service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage = '';

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
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
              height: 95,
            ),
            TextField(
              controller: emailController,
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
              controller: passwordController,
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
                signIn();
              },
              child: Text(
                'Giriş Yap',
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
                  'Hesabınız yok mu?',
                  style: GoogleFonts.indieFlower(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Kayıt Ol',
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
