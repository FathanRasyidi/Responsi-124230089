class Meals {
  final String id;
  final String meals;
  final String image;

  Meals({
    required this.id,
    required this.meals,
    required this.image
  });

  // Factory method untuk mengubah JSON Map menjadi Object Meals
  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      id: json['idMeal'] ?? '',
      meals: json['strMeal'] ?? '',
      image: json['strMealThumb'] ?? '',
    );
  }
}