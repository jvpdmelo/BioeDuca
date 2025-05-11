import 'package:flutter/material.dart';
import 'design_static.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF1F8E9); // fundo do container interno
    const Color highlightColor = Color(0xFF2E7D32); // destaque
    const Color textColor = Color(0xFF333333); // texto padrão
    const Color containerColor = Color(0xFFA5D6A7); // container externo

    return Design(
      title: 'SOBRE',
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
            child: Container(
              width: 1000,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.brown, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Disciplina
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nome da Disciplina:',
                          style: TextStyle(
                            color: highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '\nDesenvolvimento de Software\n',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Professor Responsável
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nome do Professor Responsável:',
                          style: TextStyle(
                            color: highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '\nProf.Dr.Elvio Gilberto da Silva\n',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20), // separação

                  // Professores Colaboradores
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Nome e Titulação de Professores Colaboradores:',
                          style: TextStyle(
                            color: highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '\nProfa.Dr.Eliane Aparecida Toledo Pinto\n',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // separação

                  // Desenvolvedores
                  const Text(
                    'Nomes Completos dos Integrantes e Colaboradores do Grupo:',
                    style: TextStyle(
                      color: highlightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• João Victor Pires de Melo;',
                    style: TextStyle(fontSize: 18, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '• Heytor Vinicios Fonseca Palheta Ferreira;',
                    style: TextStyle(fontSize: 18, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '• Nicolas Barbosa Freitas;',
                    style: TextStyle(fontSize: 18, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '• Victor Lambertini da Costa.\n',
                    style: TextStyle(fontSize: 18, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  // IMAGENS FINAIS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Esquerda: Desenvolvimento
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Desenvolvimento:',
                            style: TextStyle(
                              color: highlightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/images/anime.png',
                            width: 150,
                          ),
                        ],
                      ),

                      // Direita: Apoio
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Apoio:',
                            style: TextStyle(
                              color: highlightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/images/anime.png',
                            width: 150,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
