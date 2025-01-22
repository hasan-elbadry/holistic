import 'package:flutter/cupertino.dart';
import 'package:holistic/models/article_model.dart';
import 'package:holistic/services/api_services.dart';

class NewsAppProvider with ChangeNotifier {
  var category = TextEditingController();
  List<ArticleModel> articles = [];

  Future<void> get() async {
    articles = await ApiServices.getCategory(category.text);
    notifyListeners();
  }
}
