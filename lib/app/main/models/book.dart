class Book {
  String? isbn;
  String? title;
  double? price;
  String? cover;
  List<String>? synopsis;

  Book({
    this.isbn,
    this.title,
    this.price,
    this.cover,
    this.synopsis
  });

  Book.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    title = json['title'];
    price = double.parse(json['price'].toString()) ;
    cover = json['cover'];
    synopsis = json['synopsis'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isbn'] = isbn;
    data['title'] = title;
    data['price'] = price;
    data['cover'] = cover;
    data['synopsis'] = synopsis;
    return data;
  }
}