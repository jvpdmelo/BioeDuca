import 'package:flutter/material.dart';
import 'package:bioeduca/topic_detail.dart';
import 'package:bioeduca/topics_texts.dart';
import 'package:bioeduca/design_static.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<Map<String, String>> topics = [
    {
      'title': 'Agenda 2030',
      'description': 'Plano global da ONU...',
      'image': 'assets/images/agenda2030.jpeg',
    },
    {
      'title': 'Compromisso Socioambiental',
      'description': 'Responsabilidade de cidadãos...',
      'image': 'assets/images/compromissosocioambiental.jpeg',
    },
    {
      'title': 'Desafios e Perspectivas',
      'description': 'Principais desafios...',
      'image': 'assets/images/desafiosperspectivas.jpeg',
    },
    {
      'title': 'Educação Ambiental',
      'description': 'Busca criar consciência ambiental...',
      'image': 'assets/images/educacaoambiental.jpeg',
    },
    {
      'title': 'Sustentabilidade',
      'description': 'Uso responsável dos recursos...',
      'image': 'assets/images/sustentabilidade.jpeg',
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
          topic['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final String query = _controller.text.toLowerCase();

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
            ...filteredTopics.map((topic) {
              final title = topic['title']!;
              final lowerTitle = title.toLowerCase();
              final startIndex = lowerTitle.indexOf(query);
              final endIndex = startIndex + query.length;

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
                            child: startIndex >= 0
                                ? Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: title.substring(0, startIndex),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  TextSpan(
                                    text: title.substring(
                                        startIndex, endIndex),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.yellow,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  TextSpan(
                                    text: title.substring(endIndex),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Text(
                              title,
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
            }).toList(),
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
