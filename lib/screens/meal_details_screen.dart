import 'package:flutter/material.dart';
import 'package:nourriture/components/image_rounded.dart';
import 'package:nourriture/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  /// Trata o Clique no Botão de Favoritar
  final void Function(Meal) onClickFavorite;

  /// Verifica se a comida é Favorita
  final bool Function(Meal) isFavoriteMeal;

  const MealDetailsScreen({
    Key? key,
    required this.onClickFavorite,
    required this.isFavoriteMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Obtem o Item Passado pela Rota
    final mealItem = ModalRoute.of(context)?.settings.arguments as Meal;

    // Cria uma Lista de Widgets dos Ingredientes
    final List<Widget> ingredientsWidget = mealItem.ingredients.map((element) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            child: Text(element),
          ),
        ),
      );
    }).toList();

    // Cria uma Lista de Widgets do Passo a Passo
    final List<Widget> stepWidget = mealItem.steps.map((element) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // Exibe o Numero e a Descrição do Passo
            ListTile(
              leading: CircleAvatar(
                child: Text("${mealItem.steps.indexOf(element) + 1}"),
              ),
              title: Text(element),
            ),
            // Adiciona uma Linha Divisoria à todos os elementos
            if (mealItem.steps.last != element) const Divider(),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ImageRounded(
                urlImage: mealItem.imageUrl,
                radiusTop: 0,
                radiusBottom: 10,
              ),
            ),
            _sectionTitle(context, "Ingredientes"),
            _sectionItems(context, ingredientsWidget),
            _sectionTitle(context, "Passo a Passo"),
            _sectionItems(context, stepWidget),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Diferencia o Estado do Clique nos Itens
        child: Icon(
          isFavoriteMeal(mealItem)
              ? Icons.star_rounded
              : Icons.star_border_rounded,
        ),
        onPressed: () => onClickFavorite(mealItem),
      ),
    );
  }

  /// Retorna o Titulo de Cada seção Configurado
  Container _sectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  /// Retorna um Container com uma Lista de Informações Exibidas
  Container _sectionItems(BuildContext context, final List<Widget> itemsShow) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: itemsShow,
      ),
    );
  }
}
