import 'dart:convert';

class PostModel {
  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  List<PostModel> fromListJson(String json) {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded
        .map(
          (e) => PostModel.fromJson(e),
        )
        .toList();
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }
}
