import 'package:flutter/material.dart';
import 'package:nourriture/components/category_item.dart';
import 'package:nourriture/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      // Sliver= Area que permite Scrool e GridDelegate= Como a Grid será renderizada
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategory.map((categoryElement) {
        return CategoryItem(category: categoryElement);
      }).toList(),
    );
  }
}
