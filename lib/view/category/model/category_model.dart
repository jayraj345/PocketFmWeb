class Category {
  final String id;
  final String name;
  final String? img; // Nullable since the image field is null in the data

  Category({
    required this.id,
    required this.name,
    this.img,
  });

  // Factory constructor to create an instance of Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      img: json['img'],
    );
  }

  // Method to convert an instance of Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
    };
  }
}
