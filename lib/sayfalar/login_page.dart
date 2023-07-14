import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  bool isTurkish = true;

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
              'baslik'.tr,
              style: GoogleFonts.indieFlower(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'hg'.tr,
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
                labelText: 'emailAdres'.tr,
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
                labelText: 'sifre'.tr,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(147, 179, 117, 186),
              ),
              onPressed: () {
                signIn();
              },
              child: Text(
                'giris'.tr,
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
                  'hesapYok'.tr,
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
                    'kayitOl'.tr,
                    style: GoogleFonts.indieFlower(
                        color: Colors.blue, fontSize: 15),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.updateLocale(
                        const Locale("tr", "TR"),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Türkçe',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.updateLocale(
                        const Locale("en", "EN"),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'English',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
