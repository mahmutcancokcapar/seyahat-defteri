import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/service/widget_tree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkInternetAndNavigate();
  }

  Future<void> checkInternetAndNavigate() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Timer(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const WidgetTree(),
            ),
          );
        });
      }
    } on SocketException catch (_) {
      Timer(
        const Duration(seconds: 2),
        () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false, // Geri tuşunu engelle
                child: AlertDialog(
                  title: Text(
                    'Uyarı',
                    style: GoogleFonts.spaceGrotesk(),
                  ),
                  content: Text(
                    'İnternet bağlantınızı kontrol ediniz.',
                    style: GoogleFonts.indieFlower(),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text(
                        'Tamam',
                        style: GoogleFonts.spaceGrotesk(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.transparent,
          width: 150,
          height: 150,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
