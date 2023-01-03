import 'package:http_api/http/model/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<PostModel>> fetchPost() async {
  PostModel post = PostModel();
  const String baseURL = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(baseURL));

  if (response.statusCode == 200) {
    return post.fromListJson(response.body);
  } else {
    throw Exception('Falha ao carregar o post!');
  }
}
