class ArticleModel {
  String image;
  String title;
  String description;

  ArticleModel(
      {required this.title, required this.image, required this.description});

  static List<ArticleModel> fetch(dynamic data) {
    List<ArticleModel> articles = [];
    for (var article in data['articles']) {
      articles.add(ArticleModel(
          title: article['title']?? '',
          image: article['urlToImage']??'',
          description: article['description']??''));
    }
    return articles;
  }
}
