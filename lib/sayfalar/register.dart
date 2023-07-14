import 'dart:core';
import 'package:flutter/material.dart';
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
                'Kayıt Başarısız',
                style: GoogleFonts.spaceGrotesk(),
              ),
              content: Text(
                'Bir hata oluştu, lütfen tekrar deneyiniz.',
                style: GoogleFonts.indieFlower(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Tamam',
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
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      registerUser(context);
                      //createUser();
                      /*
                      setState(() {
                        _isLoading = true;
                      });
                      await signUp(
                          userEmail: remailController.text,
                          userPassword: rpasswordController.text,
                          context: context);
                      if (remailController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const EmailVerification(),
                          ),
                        );
                      }
                      setState(() {
                        _isLoading = false;
                      });*/
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
