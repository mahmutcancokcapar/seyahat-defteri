import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/setting_/bize_ulasin.dart';
import 'package:seydef/sayfalar/setting_/gonderi_silme.dart';
import 'package:seydef/sayfalar/setting_/hakkimizda.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri instagram = Uri.parse('https://www.instagram.com');
final Uri facebook = Uri.parse('https://tr-tr.facebook.com');
final Uri twitter = Uri.parse(
    'https://twitter.com/i/flow/login?redirect_after_login=%2F%3Flang%3Dtr');

Future<void> _launchURLinsta() async {
  if (!await launchUrl(instagram)) {
    throw 'Could not launch $instagram';
  }
}

Future<void> _launchURLfacebook() async {
  if (!await launchUrl(facebook)) {
    throw 'Could not launch $facebook';
  }
}

Future<void> _launchURLtwitter() async {
  if (!await launchUrl(twitter)) {
    throw 'Could not launch $twitter';
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'settingsPageAppBar'.tr,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Hakkimizda(),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'hakkimizda'.tr,
                  style: GoogleFonts.spaceGrotesk(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GonderiSilme(),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'gonderiSilme'.tr,
                  style: GoogleFonts.spaceGrotesk(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BizeUlasin(),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'bizeUlas'.tr,
                  style: GoogleFonts.spaceGrotesk(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                _displayBottomSheet(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'sosyalMedya'.tr,
                  style: GoogleFonts.spaceGrotesk(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      showDragHandle: true,
      context: context,
      builder: (context) => SizedBox(
        height: 500,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _launchURLinsta();
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Instagram',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURLfacebook();
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Facebook',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURLtwitter();
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Twitter',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
