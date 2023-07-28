import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SifreUnuttumPage extends StatefulWidget {
  const SifreUnuttumPage({super.key});

  @override
  State<SifreUnuttumPage> createState() => _SifreUnuttumPageState();
}

class _SifreUnuttumPageState extends State<SifreUnuttumPage> {
  final emailController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void checkFields() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'sifreYenileDialog'.tr,
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'sifreYenileBaslik'.tr,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) => checkFields(),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(147, 179, 117, 186),
                  ),
                  onPressed: isButtonEnabled ? resetPassword : null,
                  child: Text(
                    'sifreYenileButton'.tr,
                    style: GoogleFonts.spaceGrotesk(fontSize: 20),
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
