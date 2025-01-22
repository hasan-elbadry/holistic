import 'package:flutter/material.dart';
import 'package:holistic/providers/news_app_provider.dart';
import 'package:provider/provider.dart';

import '../widget/customs.dart';
import 'category_screen.dart';

class NewsAppScreen extends StatelessWidget {
  const NewsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NewsAppProvider>(context, listen: false);
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search News'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              textFormFieldCustom('search for categories', false,
                  provider.category, Icons.search),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                    }
                  },
                  child: const Text('Search', style: TextStyle(fontSize: 25)))
            ],
          ),
        ),
      ),
    );
  }
}
