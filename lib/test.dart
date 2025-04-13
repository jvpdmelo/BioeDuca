import 'package:flutter/material.dart';
import 'design_static.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Test> {
  // Lista de tópicos com imagem e título
  final List<Map<String, String>> topics = [
    {
      'title': 'Ecologia',
      'description': 'Estudo das interações entre organismos e o ambiente.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Sustentabilidade',
      'description': 'Uso responsável dos recursos naturais.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Reciclagem',
      'description': 'Processo de transformação de materiais para reutilização.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Mudanças Climáticas',
      'description': 'Alterações no clima da Terra devido a fatores humanos e naturais.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Poluição',
      'description': 'Contaminação do meio ambiente por substâncias prejudiciais.',
      'image': 'assets/images/anime.png',
    },
  ];

  // Controlador para o campo de pesquisa
  TextEditingController _controller = TextEditingController();

  // Filtro de pesquisa
  List<Map<String, String>> filteredTopics = [];

  @override
  void initState() {
    super.initState();
    filteredTopics = topics; // Inicializa com todos os tópicos
  }

  // Função para atualizar os tópicos filtrados com base na pesquisa
  void _filterTopics(String query) {
    setState(() {
      filteredTopics = topics
          .where((topic) =>
      topic['title']!.toLowerCase().contains(query.toLowerCase()) ||
          topic['description']!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Design(
      title: 'TÓPICOS',
      content: Container(
        color: const Color(0xFFF1F8E9),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Barra de pesquisa
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: _controller,
                onChanged: _filterTopics, // Filtra a pesquisa
                decoration: InputDecoration(
                  labelText: 'Pesquisar Tópicos',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            // Exibe os cards filtrados
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(filteredTopics.length, (index) {
                    final topic = filteredTopics[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xFFA5D6A7),
                        child: SizedBox(
                          width: screenSize.width * 0.8,
                          height: screenSize.height * 0.6, // Aumentamos a altura
                          child: Column(
                            children: [
                              // A imagem ocupa 100% da largura do card
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  topic['image']!,
                                  width: double.infinity,
                                  height: 270, // Aumentamos a altura da imagem
                                  fit: BoxFit.cover, // Mantém a proporção da imagem
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente
                                  children: [
                                    Text(
                                      topic['title']!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF333333),
                                      ),
                                      textAlign: TextAlign.center, // Centraliza o título
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      topic['description']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF333333),
                                      ),
                                      textAlign: TextAlign.center, // Centraliza a descrição
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
