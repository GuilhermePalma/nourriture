import 'package:flutter/material.dart';
import 'package:nourriture/components/custom_drawer.dart';
import 'package:nourriture/screens/categories_screen.dart';
import 'package:nourriture/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Controla o Index da Tela/Titulo Exibido
  int _selectScreenIndex = 0;

  // Lista com o Titulo e Telas que serão Mostradas
  final List<Map<String, Object>> _listScreens = [
    {
      // Parametros da AppBar e Body
      "title": "Vamos Cozinhar ?",
      "screen": const CategoriesScreen(),
      // Parametros do Item no Menu Inferior
      "label": "Categorias",
      "icon": const Icon(Icons.category_rounded),
    },
    {
      "title": "Comidas Favoritas",
      "screen": const FavoriteScreen(),
      "label": "Favoritas",
      "icon": const Icon(Icons.star_rate_rounded)
    },
  ];

  /// Altera o Index do Item Selecionado
  _selectedScreen(int index) => setState(() => _selectScreenIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_listScreens.elementAt(_selectScreenIndex)["title"] as String),
      ),
      drawer: const CustomDrawer(),
      body: _listScreens.elementAt(_selectScreenIndex)["screen"] as Widget,
      // Cria o Menu Inferior
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectScreenIndex,
        // Cria os Itens do Menu Inferior
        items: _listScreens
            .map(
              (screenElement) => BottomNavigationBarItem(
                label: screenElement["label"] as String,
                icon: screenElement["icon"] as Icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
