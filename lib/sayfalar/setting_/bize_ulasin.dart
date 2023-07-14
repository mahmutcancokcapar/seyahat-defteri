import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BizeUlasin extends StatefulWidget {
  const BizeUlasin({super.key});

  @override
  State<BizeUlasin> createState() => _BizeUlasinState();
}

class _BizeUlasinState extends State<BizeUlasin> {
  TextEditingController konu = TextEditingController();
  TextEditingController gorus = TextEditingController();
  TextEditingController epostaController = TextEditingController();
  bool _isButtonEnabled = false;
  String konu2 = '';
  String gorus2 = '';
  String eposta = '';

  _sendMail() async {
    // Android and iOS
    String mailTo = "cokcapar@mcmedya.net"; //gönderilecek mail adresi
    String dummyMessage = "$gorus2\n--------------------\n$eposta";
    String subjectText = "$konu2";
    final uri = 'mailto:$mailTo?subject=$subjectText&body=$dummyMessage';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void _checkButtonState() {
    setState(() {
      if (konu.text.isNotEmpty &&
          epostaController.text.isNotEmpty &&
          gorus.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  void _onButtonPressed() {
    if (_isButtonEnabled) {
      _sendMail();
    }
  }

  @override
  void dispose() {
    konu.dispose();
    gorus.dispose();
    epostaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'bizeUlas'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: konu,
                maxLines: 1,
                maxLength: 50,
                style: GoogleFonts.spaceGrotesk(),
                onChanged: (val) {
                  setState(() {
                    konu2 = val;
                    _checkButtonState();
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'bizeUlasKonu'.tr,
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      konu.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: gorus,
                maxLines: 5,
                maxLength: 150,
                style: GoogleFonts.spaceGrotesk(),
                onChanged: (val) {
                  setState(() {
                    gorus2 = val;
                    _checkButtonState();
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'bizeUlasAciklama'.tr,
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      gorus.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: epostaController,
                maxLines: 1,
                maxLength: 50,
                style: GoogleFonts.spaceGrotesk(),
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() {
                    eposta = val;
                    _checkButtonState();
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'bizeUlasEposta'.tr,
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      epostaController.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(147, 179, 117, 186),
                ),
                onPressed: _isButtonEnabled ? _onButtonPressed : null,
                child: Text(
                  'bizeUlasButton'.tr,
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
