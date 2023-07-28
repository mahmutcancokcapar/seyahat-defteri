import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/service/auth.dart';

class SeePlace extends StatefulWidget {
  SeePlace({required this.doc, Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<SeePlace> createState() => _SeePlaceState();
}

class _SeePlaceState extends State<SeePlace> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('places');

  final TextEditingController _commentController = TextEditingController();
  bool _isCommentEmpty = true;
  List<Map<String, dynamic>> comments = []; // Yorumları burada saklayacağız.

  @override
  void initState() {
    super.initState();
    _loadComments(); // Yorumları yükle
    _commentController.addListener(_onTextFieldChanged);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _onTextFieldChanged() {
    setState(() {
      _isCommentEmpty = _commentController.text.isEmpty;
    });
  }

  final User? user = AuthService().currentUser;

  final snackBar = SnackBar(
    content: Text('Aktif kullanıcı ile girilen E-Mail adresi uyuşmuyor.'),
    action: SnackBarAction(label: 'Tamam', onPressed: () {}),
  );

  // Yorumları yüklemek için bu metod
  void _loadComments() {
    FirebaseFirestore.instance
        .collection('places')
        .doc(widget.doc.id)
        .collection('comments')
        .get()
        .then((querySnapshot) {
      setState(() {
        comments = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }).catchError((error) {
      print('Yorumlar yüklenirken bir hata oluştu.');
    });
  }

  void _sendMessage() {
    String comment = _commentController.text.trim();
    String userEmail = user?.email ?? 'User email';
    FirebaseFirestore.instance
        .collection('places')
        .doc(widget.doc.id)
        .collection('comments')
        .add({
      'userName': userEmail,
      'comment': comment,
    }).then((value) {
      _commentController.clear();
      setState(() {
        _isCommentEmpty = true; // Yorum eklenince yorum yok olarak işaretle.
        _loadComments(); // Yorumları güncelle
      });
    }).catchError((error) {
      print('Yorum gönderilirken hata oldu.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade700,
        title: Text(
          widget.doc['userEmail'],
          style: GoogleFonts.spaceGrotesk(
            color: Colors.grey.shade700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.doc['title'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    widget.doc['description'],
                    textAlign: TextAlign.start,
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
          Container(
            color: Colors.white,
            child: const Divider(),
          ),
          Container(
            width: double.infinity,
            height: 30,
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(147, 179, 117, 186),
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              'yorumlar'.tr,
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                var comment = comments[index];
                return Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                    left: 4,
                    right: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Gölge rengi
                        spreadRadius: 0.5, // Gölgenin yayılma boyutu
                        blurRadius: 5, // Gölgelendirme bulanıklığı
                        offset: Offset(0, 3), // Gölgenin konumu (x, y)
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      comment['userName'] ?? '',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      comment['comment'] ?? '',
                      style: GoogleFonts.indieFlower(
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.spaceGrotesk(),
                controller: _commentController,
                onChanged: (value) {
                  // Burada artık setState çağrısına ihtiyacımız yok.
                  // Yorum eklendiğinde veya metin değiştiğinde herhangi bir güncelleme yapmıyoruz.
                },
                cursorColor: Colors.grey,
                maxLength: 140,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: _isCommentEmpty ? null : _sendMessage,
                    icon: Icon(Icons.send_outlined),
                  ),
                  hintText: 'yorumEkle'.tr,
                  hintStyle: GoogleFonts.indieFlower(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
