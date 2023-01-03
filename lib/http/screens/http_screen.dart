import 'package:flutter/material.dart';
import 'package:http_api/http/model/post_model.dart';

class HttpScreen extends StatelessWidget {
  const HttpScreen({
    super.key,
    required this.fetchPost,
  });

  final Future<List<PostModel>> fetchPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Acessando API com HTTP'),
      ),
      body: FutureBuilder(
        future: fetchPost,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<PostModel>? posts = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: posts!.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(posts[index].body!),
                      ),
                      const Divider(
                        color: Colors.red,
                      )
                    ],
                  );
                }),
              ),
            );

            //
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );

            //
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
