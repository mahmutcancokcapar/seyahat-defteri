class Places {
  String id;
  final String title;
  final String description;
  final String date;
  final String userEmail; //changed

  Places({
    required this.date,
    this.id = '',
    required this.title,
    required this.description,
    required this.userEmail, //changed
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
        'userEmail': userEmail, //changed
      };

  static Places fromJson(Map<String, dynamic> json) => Places(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        userEmail: json['userEmail'], //changed
      );
}
