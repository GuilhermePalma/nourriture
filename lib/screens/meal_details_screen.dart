import 'package:flutter/material.dart';
import 'package:nourriture/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealItem = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: const Center(
        child: Text("Detalhes"),
      ),
    );
  }
}
