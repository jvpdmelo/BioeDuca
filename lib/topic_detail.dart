import 'package:flutter/material.dart';
import 'package:bioeduca/topics_texts.dart';

class TopicDetail extends StatelessWidget {
  final String title;
  final String image;
  final List<String> contentParts;
  final String description;

  const TopicDetail({
    super.key,
    required this.title,
    required this.image,
    required this.contentParts,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF4CAF50),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.fullscreen, color: Colors.white, size: 30),
                    tooltip: 'Ampliar imagem',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: InteractiveViewer(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Descrição
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFC8E6C9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFF388E3C)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Balões de texto
            ...List.generate(contentParts.length, (index) {
              final isLeft = index % 2 == 0;
              final Color balloonColor = isLeft
                  ? const Color(0xFFD0F8CE)
                  : const Color(0xFFA5D6A7);
              return Align(
                alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(12),
                  constraints: const BoxConstraints(maxWidth: 1000),
                  decoration: BoxDecoration(
                    color: balloonColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isLeft ? 0 : 16),
                      bottomRight: Radius.circular(isLeft ? 16 : 0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isLeft)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            width: 100,
                            height: 100,
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
                        ),
                      Flexible(
                        child: Text(
                          contentParts[index],
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      if (!isLeft)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            width: 100,
                            height: 100,
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
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
