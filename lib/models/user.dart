class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  @override
  toString() => 'userId: $userId'
      'id: $id'
      'title: $title'
      'body: $body';

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId.toString();
    data['id'] = this.id.toString();
    data['title'] = this.title.toString();
    data['body'] = this.body.toString();

    return data;
  }

  factory User.fromMap(Map<dynamic, dynamic> data) {
    return User(
      userId: data['userId'] ?? '',
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      body: data['body'] ?? '',
    );
  }
}
