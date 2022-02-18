import 'package:flutter/material.dart';
import 'package:nourriture/utils/app_routes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ocorreu um Erro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ocorreu um Erro ao Executar sua Solicitação. Tente Novamente !",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/error_404.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.homeRoute),
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text("Voltar ao Inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
