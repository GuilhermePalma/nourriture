import 'package:flutter/material.dart';
import 'package:nourriture/components/custom_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text("Tela de Configurações"),
      ),
    );
  }
}
