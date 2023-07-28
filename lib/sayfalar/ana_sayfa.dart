import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:seydef/sayfalar/add_place.dart';
import 'package:seydef/sayfalar/discover_page.dart';
import 'package:seydef/sayfalar/search_page.dart';
import 'package:seydef/sayfalar/setting_/settings.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = [
    const Discover(),
    const SearchPage(),
    const AddPlace(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.donut_small_outlined,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.add,
        size: 30,
      ),
      const Icon(
        Icons.settings,
        size: 30,
      )
    ];

    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            //extendBody: true,
            backgroundColor: Colors.white,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.black)),
              child: CurvedNavigationBar(
                key: navigationKey,
                color: Colors.white,
                buttonBackgroundColor: const Color.fromARGB(147, 179, 117, 186),
                items: items,
                height: 60,
                index: 0,
                backgroundColor: Colors.white,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
            body: screens[index],
          ),
        ),
      ),
    );
  }
}
