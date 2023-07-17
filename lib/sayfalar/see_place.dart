import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SeePlace extends StatefulWidget {
  SeePlace({required this.doc, super.key});
  QueryDocumentSnapshot doc;

  @override
  State<SeePlace> createState() => _SeePlaceState();
}

class _SeePlaceState extends State<SeePlace> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('places');
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade700,
        title: Text(
          widget.doc['userEmail'],
          style: GoogleFonts.spaceGrotesk(
            color: Colors.grey.shade700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  width: mediaQuery.size.width * 1,
                  height: mediaQuery.size.height * 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.doc['title'],
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: Divider(),
                        ),
                        Text(
                          widget.doc['description'],
                          style: GoogleFonts.indieFlower(
                            textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
