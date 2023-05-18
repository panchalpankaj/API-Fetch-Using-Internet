
class Article {
  String? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  Article({

    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,

  });

  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
      id: json['id'].toString(),
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}





