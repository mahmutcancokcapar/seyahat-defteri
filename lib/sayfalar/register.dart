import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/email_verification_page.dart';
import 'package:seydef/sayfalar/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController remailController = TextEditingController();
  TextEditingController rpasswordController = TextEditingController();
  TextEditingController rpasswordAgainController = TextEditingController();
  final bool _isLoading = false;
  String errorMessage = '';
  bool isObsecure = true;

  Future<void> registerUser(BuildContext context) async {
    try {
      if (rpasswordController.text == rpasswordAgainController.text) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: remailController.text.trim(),
          password: rpasswordController.text.trim(),
        );
        await userCredential.user!.sendEmailVerification();
        // Kayıt başarılı, doğrulama epostası gönderildi
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmailVerification(),
          ),
        );
      } else {
        errorMessage = 'sifreTekrar'.tr;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Hata oldu, kayıt başarısız
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'registerDialog1'.tr,
              style: GoogleFonts.spaceGrotesk(),
            ),
            content: Text(
              'registerDialog2'.tr,
              style: GoogleFonts.indieFlower(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'registerDialog3'.tr,
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
    Icon iconn = isObsecure
        ? const Icon(
            Icons.remove_red_eye_rounded,
            color: Colors.grey,
          )
        : const Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.green,
          );
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'baslik'.tr,
                  style: GoogleFonts.tangerine(
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'hg'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 45,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: remailController,
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
                  controller: rpasswordController,
                  obscureText: isObsecure,
                  style: GoogleFonts.indieFlower(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: iconn,
                      onPressed: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                    ),
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
                TextField(
                  controller: rpasswordAgainController,
                  obscureText: isObsecure,
                  style: GoogleFonts.indieFlower(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: iconn,
                      onPressed: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                    ),
                    labelText: 'sifreTekrarText'.tr,
                    focusColor: Colors.black,
                    labelStyle: GoogleFonts.indieFlower(
                      color: const Color.fromARGB(255, 130, 126, 126),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(147, 179, 117, 186),
                        ),
                        onPressed: () {
                          registerUser(context);
                        },
                        child: Text(
                          'kayitOl'.tr,
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
                      'hesapVar'.tr,
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
                        'giris'.tr,
                        style: GoogleFonts.indieFlower(
                            color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
