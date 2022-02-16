import 'package:flutter/material.dart';
import 'package:nourriture/screens/categories_meals_screen.dart';
import 'package:nourriture/screens/categories_screen.dart';
import 'package:nourriture/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar ?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              button: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      /// Define as Rotas Nomeadas e a Rota Inicial
      routes: {
        // Caso queira definir a rota padrão, colocar no nome apenas "/"
        AppRoutes.homeRoute: (ctx) => const CategoriesScreen(),
        AppRoutes.categoryMeals: (ctx) => const CategoriesMealsScreen(),
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}
