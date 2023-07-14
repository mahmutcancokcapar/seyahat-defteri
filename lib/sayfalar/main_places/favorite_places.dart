import 'package:flutter/material.dart';

class FavoritePlaces extends StatefulWidget {
  const FavoritePlaces({super.key});

  @override
  State<FavoritePlaces> createState() => _FavoritePlaces();
}

class _FavoritePlaces extends State<FavoritePlaces> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favori Yerlerim'),
    );
  }
}
