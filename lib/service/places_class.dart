class Places {
  String id;
  final String title;
  final String description;
  final String date;
  final String userEmail;
  final String kayitliKonum;

  Places({
    required this.date,
    this.id = '',
    required this.title,
    required this.description,
    required this.userEmail,
    required this.kayitliKonum,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
        'userEmail': userEmail, //changed
        'kayitliKonum': kayitliKonum,
      };

  static Places fromJson(Map<String, dynamic> json) => Places(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        userEmail: json['userEmail'], //changed
        kayitliKonum: json['kayitliKonum'],
      );
}
