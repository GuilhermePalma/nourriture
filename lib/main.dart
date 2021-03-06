import 'package:flutter/material.dart';
import 'package:nourriture/models/filters.dart';
import 'package:nourriture/screens/categories_meals_screen.dart';
import 'package:nourriture/screens/error_screen.dart';
import 'package:nourriture/screens/meal_details_screen.dart';
import 'package:nourriture/screens/filters_screen.dart';
import 'package:nourriture/screens/tabs_screen.dart';
import 'package:nourriture/utils/app_routes.dart';
import 'package:nourriture/data/dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variavel que armazena os Filtros e as Comidas que serão exibidas
  Filters filters = Filters();
  List<Meal> avalaibleMeals = dummyMeals;
  List<Meal> favoritesMeals = [];

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
        AppRoutes.homeRoute: (ctx) =>
            TabsScreen(favoritesMeals: favoritesMeals),
        AppRoutes.categoryMeals: (ctx) =>
            CategoriesMealsScreen(avalaibleMeals: avalaibleMeals),
        AppRoutes.mealDetails: (ctx) => MealDetailsScreen(
              onClickFavorite: _toggleFavorites,
              isFavoriteMeal: _isFavoriteMeal,
            ),
        AppRoutes.filters: (ctx) =>
            FiltersScreen(filters: filters, onFiltersChanged: _filterMeals),
      },
      initialRoute: AppRoutes.homeRoute,
      // As Rotas são acessadads pro meio da seguinte hierarquia de navegação: Rotas em 'routes',
      //  depois em 'onGenerateRoute' e depois em 'onUnknownRoute';
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const ErrorScreen()),
    );
  }

  /// Metodo Responsavel por Controlar os Filtros Selecionados pelo Usuario
  void _filterMeals(Filters filtersUpdated) {
    setState(() {
      filters = filtersUpdated;

      avalaibleMeals = dummyMeals.where((mealItem) {
        final filterGluten =
            filtersUpdated.isGlutenFree && !mealItem.isGlutenFree;
        final filterLactose =
            filtersUpdated.isLactoseFree && !mealItem.isLactoseFree;
        final filterVegan = filtersUpdated.isVegan && !mealItem.isVegan;
        final filterVegetarian =
            filtersUpdated.isVegetarian && !mealItem.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  /// Controla a lista das comidas Favoritadas
  void _toggleFavorites(Meal meal) {
    setState(() {
      favoritesMeals.contains(meal)
          ? favoritesMeals.remove(meal)
          : favoritesMeals.add(meal);
    });
  }

  /// Retorna se uma comida foi ou não favoritada
  bool _isFavoriteMeal(Meal meal) => favoritesMeals.contains(meal);
}
