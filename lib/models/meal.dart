enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> listCategories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.listCategories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get getComplexity {
    switch (complexity) {
      case Complexity.simple:
        return "Fácil";
      case Complexity.medium:
        return "Normal";
      case Complexity.difficult:
        return "Dificil";
      default:
        return "Desconhecido";
    }
  }

  get getCost {
    switch (cost) {
      case Cost.cheap:
        return "Barato";
      case Cost.fair:
        return "Normal";
      case Cost.expensive:
        return "Caro";
      default:
      return "Desconhecido";
    }
  }

}
