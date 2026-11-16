import 'package:flutter/material.dart';

class TelaViagemPage extends StatelessWidget {
  const TelaViagemPage({super.key});

  static const Color corPrimaria = Color(0xFF1E88E5);

  @override
  Widget build(BuildContext context) {
    final double alturaTela = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Viagens',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: corPrimaria,
        elevation: 2,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Banner da Foto (Coliseu)
            SizedBox(
              height: alturaTela * 0.27,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    'assets/coliseu.jpg',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://images.unsplash.com/photo-1552832230-c0197dd311b5?q=80&w=1000&auto=format&fit=crop',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Roma',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Coliseu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2. Conteúdo inferior proporcional sem rolagem
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Botões de Ação
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildItemAcao(
                          icon: const Icon(Icons.location_on_outlined,
                              color: corPrimaria, size: 26),
                          label: 'Quero Ir',
                        ),
                        _buildItemAcao(
                          icon: const Icon(Icons.check_circle_outline,
                              color: corPrimaria, size: 26),
                          label: 'Já Fui',
                        ),
                        _buildItemAcao(
                          icon: const Icon(Icons.share,
                              color: corPrimaria, size: 26),
                          label: 'Compartilhar',
                        ),
                        _buildItemAcao(
                          icon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: corPrimaria, size: 15),
                              Icon(Icons.star, color: corPrimaria, size: 15),
                              Icon(Icons.star, color: corPrimaria, size: 15),
                            ],
                          ),
                          label: 'Avaliações',
                        ),
                      ],
                    ),

                    // Texto Justificado
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id diam id ligula ultricies pulvinar. In neque lectus, sagittis eu libero et, venenatis lacinia nulla. Etiam eget purus leo. Nam consectetur ornare est eu lobortis. Morbi eu augue eu lectus condimentum vestibulum. Etiam id nibh luctus, porttitor arcu et, porttitor purus. Pellentesque vulputate nibh sit amet rutrum viverra. Nullam eget metus est. Integer condimentum, odio sed congue malesuada, ipsum nisi bibendum lectus, quis porttitor ante lacus in mi. Curabitur eget imperdiet ante. Aliquam magna tortor, volutpat sit amet mi a, cursus malesuada leo. Aenean dolor erat, gravida ut ultricies sed, convallis nec ipsum.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 11.5,
                        height: 1.28,
                      ),
                    ),

                    // "Pessoas Encontradas" + "Filtrar"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Pessoas Encontradas',
                          style: TextStyle(
                            color: corPrimaria,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.filter_alt,
                                  color: corPrimaria, size: 20),
                              Text(
                                'Filtrar',
                                style: TextStyle(
                                  color: corPrimaria,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Avatares
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        4,
                        (index) => CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey.shade400,
                          child: const Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função auxiliar dos botões de ação
  static Widget _buildItemAcao({required Widget icon, required String label}) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 26,
            child: Center(child: icon),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              color: corPrimaria,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
