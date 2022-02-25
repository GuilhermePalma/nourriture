import 'package:flutter/material.dart';
import 'package:nourriture/components/meal_item.dart';
import 'package:nourriture/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Configura Layouts diferentes para a lista vazia ou preenchida
    return favoriteMeals.isEmpty
        ? Center(
            child: Text(
              "Nenhuma Comida foi salva como Favorita",
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) =>
                MealItem(meal: favoriteMeals.elementAt(index)),
          );
  }
}
