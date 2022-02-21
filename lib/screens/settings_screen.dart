import 'package:flutter/material.dart';
import 'package:nourriture/components/custom_drawer.dart';
import 'package:nourriture/utils/app_routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: CustomDrawer(
        // Informa que a Tela é das Configurações
        routeName: AppRoutes.settings,
      ),
      body: const Center(
        child: Text("Tela de Configurações"),
      ),
    );
  }
}
