import 'package:flutter/material.dart';
import 'package:nourriture/components/image_rounded.dart';
import 'package:nourriture/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  // Variavel que define qual Local em que está para selecionar o Item no Menu
  final String routeName;

  CustomDrawer({
    Key? key,
    required this.routeName,
  }) : super(key: key);

  // Lista com os Valores dos Itens que serão Exibidos
  final List<Map<String, Object>> _itemsMenu = [
    {
      "title": "Refeições",
      "icon": Icons.restaurant_rounded,
      "routeName": AppRoutes.homeRoute,
    },
    {
      "title": "Configurações",
      "icon": Icons.settings_rounded,
      "routeName": AppRoutes.settings,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // Propriedade que coloca espaço proporcionais ENTRE os Items
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column para a primeira parte do Conteudo ficar fixa no Topo e as Configurações no Fim
          Column(
            children: [
              _createNavigationHeader(context),
              ..._itemsMenu.getRange(0, _itemsMenu.length - 1).map((menuItem) {
                return _createItem(
                  menuItem["icon"] as IconData,
                  menuItem["title"] as String,
                  menuItem["routeName"] == routeName,
                  () => Navigator.of(context)
                      .pushReplacementNamed(menuItem["routeName"] as String),
                );
              }).toList()
            ],
          ),

          _createItem(
            _itemsMenu.last["icon"] as IconData,
            _itemsMenu.last["title"] as String,
            _itemsMenu.last["routeName"] == routeName,
            () => Navigator.of(context)
                .pushReplacementNamed(_itemsMenu.last["routeName"] as String),
          ),
        ],
      ),
    );
  }

  /// Cria o Header do Drawer
  Container _createNavigationHeader(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      /* decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.grey[600] ?? Colors.grey,
          width: 1.5,
        ),
      ), */
      // Exibe um Texto encima de uma Imagem
      child: Stack(
        fit: StackFit.expand,
        children: const [
          // Obtem uma Imagem com Borda
          ImageRounded(
            radiusTop: 0,
            radiusBottom: 10,
            assetImage: "assets/images/table_food.jpg",
          ),
          // Alinha o Texto no canto Inferior Esquerdo
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                "Vamos Cozinhar ?",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Cria os Itens do Menu Lateral
  Widget _createItem(
      IconData icon, String label, bool isSelected, void Function() onTap) {
    return ListTile(
      selected: isSelected,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
