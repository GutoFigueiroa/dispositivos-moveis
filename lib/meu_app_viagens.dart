import 'package:flutter/material.dart';
import 'tela_viagem_page.dart';

class MeuAppViagens extends StatelessWidget {
  const MeuAppViagens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Viagens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const TelaViagemPage(),
    );
  }
}
