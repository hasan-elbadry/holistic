import 'package:flutter/material.dart';
import 'package:holistic/models/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  ArticleDetailsScreen({super.key, required this.article});

  ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(article.image),
            Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(article.description)
          ],
        ),
      ),
    );
  }
}
