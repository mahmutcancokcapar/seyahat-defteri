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
  bool _isLoading = false;
  String? errorMessage = '';

  /*
  static Future<User?> signUp({
    required String userEmail,
    required String userPassword,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint(
        e.toString(),
      );
      return null;
    }
  }
  */

  /*
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
  */

  Future<void> registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: remailController.text.trim(),
        password: rpasswordController.text.trim(),
      );
      await userCredential.user!.sendEmailVerification();
      // Kayıt başarılı, doğrulama epostası gönderildi
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EmailVerification(),
        ),
      );
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
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
