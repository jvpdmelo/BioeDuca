import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Design extends StatelessWidget {
  final String title;
  final Widget content;

  const Design({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    const Color barColor = Color(0xFF4CAF50);
    const Color drawerDarkGreen = Color(0xFF388E3C);
    const Color drawerLightGreen = Color(0xFF81C784);
    const Color drawerTextColor = Colors.white;

    return Scaffold(
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
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
          ),
        ),
        backgroundColor: barColor,
        centerTitle: true,
      ),

      // Novo menu lateral estilizado
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                drawerLightGreen,
                drawerDarkGreen,
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: drawerDarkGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.eco, size: 60, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      'Bem-vindo!',
                      style: TextStyle(
                        color: drawerTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white70),

              ListTile(
                leading: const Icon(Icons.home, color: drawerTextColor),
                title: const Text('Início', style: TextStyle(color: drawerTextColor)),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.book, color: drawerTextColor),
                title: const Text('Tópicos', style: TextStyle(color: drawerTextColor)),
                onTap: () {
                  Navigator.pushNamed(context, '/topics');
                },
              ),
              ListTile(
                leading: const Icon(Icons.people, color: drawerTextColor),
                title: const Text('Créditos', style: TextStyle(color: drawerTextColor)),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: drawerTextColor),
                title: const Text('Sair', style: TextStyle(color: drawerTextColor)),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_applications, color: drawerTextColor),
                title: const Text('Teste', style: TextStyle(color: drawerTextColor)),
                onTap: () {
                  Navigator.pushNamed(context, '/test');
                },
              ),
            ],
          ),
        ),
      ),

      body: content,
    );
  }
}
