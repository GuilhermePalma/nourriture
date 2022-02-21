import 'package:flutter/material.dart';
import 'package:nourriture/components/image_rounded.dart';
import 'package:nourriture/models/meal.dart';
import 'package:nourriture/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  _selectMeal(BuildContext context) =>
      Navigator.of(context).pushNamed(AppRoutes.mealDetails, arguments: meal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Column(
            children: [
              // Imagem Arredondada com um Texto Sobreposto
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ImageRounded(
                      urlImage: meal.imageUrl,
                      radiusTop: 15,
                      radiusBottom: 0,
                    ),
                  ),
                  // Widget Positioned define onde o Widget ficará Posicionado na Stack
                  Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        // Define a Quebra Linha e a exibição da mensagem de Overflow
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule_rounded),
                        const SizedBox(width: 6),
                        Text("${meal.duration} min"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work_rounded),
                        const SizedBox(width: 6),
                        Text(meal.getComplexity),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money_rounded),
                        const SizedBox(width: 6),
                        Text(meal.getCost),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
