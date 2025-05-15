import 'package:flutter/material.dart';
import 'design_static.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const Color containerColor = Color(0xFFA5D6A7);
    const Color textColor = Color(0xFF333333);

    return Design(
      title: 'INÍCIO',
      content: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                      children: [
                        // Imagem a Esquerda
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ //Texto a Esquerda
                            Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.white, width: 3),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/Bio.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Olá, eu me chamo Bio! Este aplicativo vai te ajudar a entender a importância do meio ambiente e alguns conceitos importantes.',
                                  style: TextStyle(fontSize: 19, height: 1.5, color: textColor),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Imagem e Texto a Direita
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ //Texto a Direita
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 6,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Oi, eu sou a Duca! Vamos juntos aprender mais sobre como cuidar do nosso planeta e transformá-lo em um lugar melhor!',
                                  style: TextStyle(fontSize: 19, height: 1.5, color: textColor),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container( //Imagem a Direita
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.white, width: 3),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/Duca.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
