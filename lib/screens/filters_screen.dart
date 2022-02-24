import 'package:flutter/material.dart';
import 'package:nourriture/components/custom_drawer.dart';
import 'package:nourriture/models/filters.dart';
import 'package:nourriture/utils/app_routes.dart';

class FiltersScreen extends StatefulWidget {

  final void Function(Filters) onFiltersChanged;
  final Filters filters;

  const FiltersScreen({
    Key? key,
    required this.filters,
    required this.onFiltersChanged,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // Classe Responsavel por Gerenciar os Valores do Filtro
  Filters ?filters;

  @override
  void initState() {
    super.initState();
    filters = widget.filters;
  }

  @override
  Widget build(BuildContext context) {
    // Lista contendo as Informações dos Switchs
    final listSwitchs = [
      {
        "title": "Sem Gluten",
        "subtitle": "Só exibe as refeições sem Gluten",
        "value": filters!.isGlutenFree,
        "function": (isSelected) => setState(() => filters!.isGlutenFree = isSelected),
      },
      {
        "title": "Sem Lactose",
        "subtitle": "Só exibe as refeições sem Lactose",
        "value": filters!.isLactoseFree,
        "function": (isSelected) => setState(() => filters!.isLactoseFree = isSelected),
      },
      {
        "title": "Opções Vegana",
        "subtitle": "Só exibe as refeições Veganas",
        "value": filters!.isVegan,
        "function": (isSelected) => setState(() => filters!.isVegan = isSelected),
      },
      {
        "title": "Opções Vegetariana",
        "subtitle": "Só exibe as refeições Vegetarianas",
        "value": filters!.isVegetarian,
        "function": (isSelected) => setState(() => filters!.isVegetarian = isSelected),
      },
    ];

    /// Crição da Arvore de Elementos (Widgets)
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filtros"),
        ),
        drawer: CustomDrawer(
          // Informa que a Tela é das Filtros
          routeName: AppRoutes.filters,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Filtros das Refeições",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listSwitchs.length,
                itemBuilder: (_, index) {
                  final item = listSwitchs.elementAt(index);
                  return _createSwitch(
                    item["title"] as String,
                    item["subtitle"] as String,
                    listSwitchs.elementAt(index)["value"] as bool,
                    listSwitchs.elementAt(index)["function"] as Function(bool),
                  );
                },
              ),
            )
          ],
        ));
  }

  /// Cria os Switch Adaptativos que serão exibidos
  Widget _createSwitch(String title, String subtitle, bool valueSwitch,
      Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: valueSwitch,
      onChanged: (newValue) {
        onChanged(newValue);
        widget.onFiltersChanged(filters!);
      },
    );
  }
}
