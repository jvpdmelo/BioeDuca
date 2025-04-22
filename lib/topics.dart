import 'package:flutter/material.dart';
import 'package:bioeduca/topic_detail.dart';
import 'package:bioeduca/topics_texts.dart';
import 'package:bioeduca/design_static.dart'; // Importa o Design

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<Map<String, String>> topics = [
    {
      'title': 'Educação Ambiental',
      'description': 'A Educação Ambiental busca criar uma sociedade mais consciente sobre as questões ambientais.',
      'image': 'assets/images/educacaoambiental.jpeg',
    },
    {
      'title': 'Sustentabilidade',
      'description': 'Sustentabilidade é o uso responsável dos recursos naturais, visando o bem-estar das futuras gerações.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Compromisso Socioambiental',
      'description': 'É a responsabilidade de cidadãos e empresas em adotar práticas sustentáveis, preservando a natureza e promovendo o bem-estar coletivo.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Agenda 2030',
      'description': 'Plano global da ONU com 17 metas que visam promover um mundo mais justo, sustentável e inclusivo até 2030.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Desafios e Perspectivas',
      'description': 'Os principais desafios incluem desinformação e falta de ação; as perspectivas apontam para a formação de cidadãos críticos e engajados em soluções ambientais reais.',
      'image': 'assets/images/anime.png',
    },
  ];

  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> filteredTopics = [];

  @override
  void initState() {
    super.initState();
    filteredTopics = topics;
  }

  void _filterTopics(String query) {
    setState(() {
      filteredTopics = topics
          .where((topic) =>
      topic['title']!.toLowerCase().contains(query.toLowerCase()) ||
          topic['description']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Design(
      title: 'TÓPICOS',
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: _controller,
                onChanged: _filterTopics,
                decoration: InputDecoration(
                  labelText: 'Pesquisar Tópicos',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            ...List.generate(filteredTopics.length, (index) {
              final topic = filteredTopics[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicDetail(
                          title: topic['title']!,
                          image: topic['image']!,
                          contentParts: getContentParts(topic['title']!),
                          description: topic['description']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: const Color(0xFFA5D6A7),
                    child: SizedBox(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.3,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              topic['image']!,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              topic['title']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<String> getContentParts(String title) {
    switch (title) {
      case 'Educação Ambiental':
        return textoEducacaoAmbiental;
      case 'Sustentabilidade':
        return textoSustentabilidade;
      case 'Compromisso Socioambiental':
        return textoCompromissoSocioambiental;
      case 'Agenda 2030':
        return textoAgenda2030;
      case 'Desafios e Perspectivas':
        return textoDesafios;
      default:
        return [];
    }
  }
}
