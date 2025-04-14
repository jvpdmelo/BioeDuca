import 'package:flutter/material.dart';
import 'design_static.dart';
import 'topic_detail.dart'; // Importa a nova tela de detalhes

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<Map<String, String>> topics = [
    {
      'title': 'Educação Ambiental',
      'description': 'Cuidar da natureza e aprender sobre sustentabilidade.',
      'fullText': 'Educação Ambiental é um processo que permite às pessoas explorar questões ambientais, envolver-se na resolução de problemas e tomar ações que melhoram o meio ambiente. Através disso, os indivíduos desenvolvem uma compreensão mais profunda dos problemas ambientais e têm as habilidades para tomar decisões informadas e responsáveis.',
      'image': 'assets/images/anime.png',
    },
    {
      'title': 'Sustentabilidade',
      'description': 'Uso responsável dos recursos naturais.',
      'fullText': 'Sustentabilidade envolve atender às necessidades do presente sem comprometer a capacidade das gerações futuras de atenderem às suas próprias necessidades. Ela busca o equilíbrio entre crescimento econômico, cuidado ambiental e bem-estar social.',
      'image': 'assets/images/anime.png',
    },
    // Adicione mais tópicos como desejar...
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(filteredTopics.length, (index) {
                    final topic = filteredTopics[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicDetail(
                              title: topic['title']!,
                              description: topic['fullText']!,
                              imagePath: topic['image']!,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: const Color(0xFFA5D6A7),
                          child: SizedBox(
                            width: screenSize.width * 0.8,
                            height: screenSize.height * 0.6,
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
                                    height: 270,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        topic['title']!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF333333),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        topic['description']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF333333),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
