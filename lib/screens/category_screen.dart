import 'package:flutter/material.dart';
import 'package:holistic/providers/news_app_provider.dart';
import 'package:holistic/screens/article_details_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});

  String category;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsAppProvider>(context);
    provider.get();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: provider.articles.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleDetailsScreen(
                                  article: provider.articles[index])));
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: Column(
                        children: [
                          Image.network(provider.articles[index].image),
                          const SizedBox(height: 5),
                          Text(
                            provider.articles[index].title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: provider.articles.length),
      ),
    );
  }
}
