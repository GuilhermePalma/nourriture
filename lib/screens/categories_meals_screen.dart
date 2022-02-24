import 'package:flutter/material.dart';
import 'package:nourriture/components/meal_item.dart';
import 'package:nourriture/models/category.dart';
import 'package:nourriture/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> avalaibleMeals;

  const CategoriesMealsScreen({
    Key? key,
    required this.avalaibleMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtem os Dados passado pela Route
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // Obtem as Comidas da Categoria Infromada
    final mealsInCategory = avalaibleMeals.where((mealElement) {
      return mealElement.listCategories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
      ),
      body: ListView.builder(
        itemCount: mealsInCategory.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (ctx, index) => MealItem(
          meal: mealsInCategory.elementAt(index),
        ),
      ),
    );
  }
}
