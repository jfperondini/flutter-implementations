class NewsParagraphModel {
  final List<String> texts;
  final List<String> images;
  final List<String> gifs;

  NewsParagraphModel({
    required this.texts,
    required this.images,
    required this.gifs,
  });

  static NewsParagraphModel fromJson(Map<String, dynamic> map) {
    return NewsParagraphModel(
      texts: map['texts'],
      images: map['images'].isEmpty ? [] : map['images'],
      gifs: map['gifs'].isEmpty ? [] : map['gifs'],
    );
  }

  bool isSearchValid(String query) {
    for (String text in texts) {
      if (text.toLowerCase().contains(query.toLowerCase())) return true;
    }
    return false;
  }
}
