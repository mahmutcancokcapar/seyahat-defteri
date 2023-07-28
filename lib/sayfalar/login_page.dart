import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/ana_sayfa.dart';
import 'package:seydef/sayfalar/register.dart';
import 'package:seydef/sayfalar/sifre_unuttum_page.dart';
import '../service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorMessage = '';
  bool isButtonEnabled = false;
  bool isTurkish = true;
  bool isObsecure = true;

  void checkField() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  Future<void> signIn() async {
    try {
      await AuthService()
          .signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AnaSayfa(),
              ),
            ),
          );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'kullaniciBulunamadi'.tr;
        } else if (e.code == 'wrong-password') {
          errorMessage = 'hataliSifre'.tr;
        } else if (e.code == 'invalid-email') {
          errorMessage = 'gecersizEposta'.tr;
        } else {
          errorMessage = 'hata'.tr;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon iconn = isObsecure
        ? Icon(
            Icons.remove_red_eye_rounded,
            color: Colors.grey,
          )
        : Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.green,
          );
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
                  controller: emailController,
                  onChanged: (value) => checkField(),
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
                  onChanged: (value) => checkField(),
                  controller: passwordController,
                  obscureText: isObsecure,
                  style: GoogleFonts.indieFlower(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: iconn,
                      onPressed: () {
                        setState(
                          () {
                            isObsecure = !isObsecure;
                          },
                        );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SifreUnuttumPage(),
                          ),
                        );
                      },
                      child: Text(
                        'sifremiUnuttum'.tr,
                        style: GoogleFonts.indieFlower(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(147, 179, 117, 186),
                  ),
                  onPressed: isButtonEnabled ? signIn : null,
                  child: Text(
                    'giris'.tr,
                    style: GoogleFonts.spaceGrotesk(fontSize: 20),
                  ),
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
                  height: 10,
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
                      const VerticalDivider(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
