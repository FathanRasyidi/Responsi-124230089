class MealsCategory {
  final String id;
  final String category;
  final String image;
  final String desc;

  MealsCategory({
    required this.id,
    required this.category,
    required this.image,
    required this.desc
  });

  // Factory method untuk mengubah JSON Map menjadi Object Meals
  factory MealsCategory.fromJson(Map<String, dynamic> json) {
    return MealsCategory(
      id: json['idCategory'] ?? '',
      category: json['strCategory'] ?? '',
      image: json['strCategoryThumb'] ?? '',
      desc: json['strCategoryDescription'] ?? ''
    );
  }
}