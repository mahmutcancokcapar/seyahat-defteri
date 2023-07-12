class Places {
  String id;
  final String title;
  final String description;
  final String date;

  Places({
    required this.date,
    this.id = '',
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
      };

  static Places fromJson(Map<String, dynamic> json) => Places(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
      );
}
