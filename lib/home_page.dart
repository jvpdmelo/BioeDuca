import 'package:flutter/material.dart';
import 'design_static.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const Color containerColor = Color(0xFFA5D6A7);
    const Color backgroundColor = Color(0xFFF1F8E9);
    const Color textColor = Color(0xFF333333);
    return Design(
      title: 'INÍCIO',
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 600),
                child: Container(
                  width: 1500,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.brown, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      // TEXTO
                      const Text(
                        'Aqui está o conteúdo. '
                            'Se esse texto for maior do que o espaço mínimo (600 de altura), '
                            '\no container vai se expandir automaticamente.',
                        style: TextStyle(fontSize: 18, color: textColor),
                        textAlign: TextAlign.justify,
                      ),

                      // IMAGEM
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/anime.png',
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: 20),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}