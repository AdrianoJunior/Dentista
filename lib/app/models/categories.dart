class Categories {
  List<String>? categories;

  Categories({this.categories});

  Categories.fromMap(Map<String, dynamic> json) {
    categories = json['categories'] ? json['categories'].cast<String>() : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categories'] = categories;
    return data;
  }
}
