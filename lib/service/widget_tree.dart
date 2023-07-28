import 'package:flutter/material.dart';
import 'package:seydef/sayfalar/ana_sayfa.dart';
import 'package:seydef/sayfalar/login_page.dart';
import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const AnaSayfa();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
