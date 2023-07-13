import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class GonderiSilme extends StatefulWidget {
  const GonderiSilme({super.key});

  @override
  State<GonderiSilme> createState() => _GonderiSilmeState();
}

class _GonderiSilmeState extends State<GonderiSilme> {
  TextEditingController silinecekBaslik = TextEditingController();
  TextEditingController silmeAciklamasi = TextEditingController();
  TextEditingController epostaController = TextEditingController();
  bool _isButtonEnabled = false;
  String silinmekIstenenBaslik = '';
  String aciklama = '';
  String eposta = '';

  
  _sendMail() async {
    // Android and iOS
    String mailTo = "cokcapar@mcmedya.net"; //gönderilecek mail adresi
    String dummyMessage = "Silmek istediğim gönderinin başlığı -> $silinmekIstenenBaslik\n--------------------\n$aciklama\n--------------------\n$eposta";
    String subjectText = "Gönderi Silme";
    final uri = 'mailto:$mailTo?subject=$subjectText&body=$dummyMessage';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void _checkButtonState() {
    setState(() {
      if (silinecekBaslik.text.isNotEmpty &&
          epostaController.text.isNotEmpty &&
          silmeAciklamasi.text.isNotEmpty) {
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
    silinecekBaslik.dispose();
    silmeAciklamasi.dispose();
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
          'Gönderi Silme',
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
                controller: silinecekBaslik,
                maxLines: 1,
                maxLength: 50,
                style: GoogleFonts.spaceGrotesk(),
                onChanged: (val) {
                  setState(() {
                    silinmekIstenenBaslik = val;
                    _checkButtonState();
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Silinecek gönderinin başlığını tam haliyle giriniz',
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      silinecekBaslik.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: silmeAciklamasi,
                maxLines: 5,
                maxLength: 150,
                style: GoogleFonts.spaceGrotesk(),
                onChanged: (val) {
                  setState(() {
                    aciklama = val;
                    _checkButtonState();
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText:
                      'Neden silinmesini istediğini birkaç cümleyle açıklayın',
                  labelStyle: GoogleFonts.indieFlower(
                    color: const Color.fromARGB(255, 130, 126, 126),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      silmeAciklamasi.clear();
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
                  labelText: 'E-Posta adresiniz',
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
                  'Gönder',
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
