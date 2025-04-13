// Importações
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Classe Principal
class Design extends StatelessWidget {
  final String title;
  final Widget content;

  const Design({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    const Color barColor = Color(0xFF4CAF50);
    const Color buttonColor = Color(0xFF00796B);
    const Color drawerColor = Color(0xFF6D4C41);
    return Scaffold(
      // Barra Superior com ícone e estilo personalizados
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            color: Colors.white,
            iconSize: 30,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // Cor personalizada
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif', // Troque por uma fonte registrada se quiser
          ),
        ),
        backgroundColor: barColor,
        centerTitle: true,
      ),

      // Menu Lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do menu
            DrawerHeader(
              decoration: const BoxDecoration(
                color: drawerColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Bem-vindo!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),

            // Itens do menu
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Tópicos'),
              onTap: () {
                Navigator.pushNamed(context, '/topics');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: const Text('Teste'),
              onTap: () {
                Navigator.pushNamed(context, '/test');
              },
            ),
          ],
        ),
      ),

      // Conteúdo da Página
      body: content,
    );
  }
}