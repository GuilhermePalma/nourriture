import 'package:flutter/material.dart';
import 'package:nourriture/components/meal_item.dart';
import 'package:nourriture/data/dummy_data.dart';
import 'package:nourriture/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtem os Dados passado pela Route
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final mealsInCategory = dummyMeals
        .where(
            (mealElement) => mealElement.listCategories.contains(category.id))
        .toList();

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
