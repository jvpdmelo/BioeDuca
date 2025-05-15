import 'package:flutter/material.dart';
import 'design_static.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFA5D6A7); //Fundo verde
    const Color highlightColor = Color(0xFF2E7D32); //Verde forte para destaque
    const Color textColor = Colors.white; //Texto menor em branco
    const Color titleColor = Color(0xFF1B5E20); //Verde mais escuro para títulos

    return Design(
      title: 'CRÉDITOS',
      content: Column(
        children: [
          const SizedBox(height: 20), // Espaço entre AppBar e container
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: backgroundColor,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Center(
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
                                color: titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text: '\nDesenvolvimento de Software\n',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
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
                              text: 'Professor Responsável:',
                              style: TextStyle(
                                color: titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text: '\nProf.Dr.Elvio Gilberto da Silva\n',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
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
                              text: 'Professora Colaboradora:',
                              style: TextStyle(
                                color: titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text: '\nProfa.Dra.Eliane Aparecida Toledo Pinto\n',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20), // separação

                      // Desenvolvedores
                      const Text(
                        'Integrantes do Grupo:',
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Heytor Vinicios Fonseca Palheta Ferreira;',
                        style: TextStyle(fontSize: 20, color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '• João Victor Pires de Melo;',
                        style: TextStyle(fontSize: 20, color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '• Nicolas Barbosa Freitas;',
                        style: TextStyle(fontSize: 20, color: textColor),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '• Victor Lambertini da Costa.\n',
                        style: TextStyle(fontSize: 20, color: textColor),
                        textAlign: TextAlign.center,
                      ),

                      // IMAGENS FINAIS - CENTRALIZADAS
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Esquerda: Desenvolvimento
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Desenvolvimento:',
                                style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image.asset(
                                'assets/images/CreditosDesenvolvimento.jpg',
                                width: 350,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30), // espaçamento entre as imagens
                          // Direita: Apoio
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Apoio:',
                                style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image.asset(
                                'assets/images/CreditosApoio.jpg',
                                width: 350,
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
        ],
      ),
    );
  }
}
