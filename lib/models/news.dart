class news {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  news(
      {required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.publishedAt,
      required this.urlToImage});

  factory news.fromJSON(Map<String, dynamic> map) {
    return news(
        author: map['author'],
        title: map['title'],
        description: map['description'],
        content: map['content'],
        publishedAt: map['publishedAt'],
        urlToImage: map['urlToImage']);
  }
}
