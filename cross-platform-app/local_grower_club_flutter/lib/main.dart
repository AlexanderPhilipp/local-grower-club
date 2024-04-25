import 'package:flutter/material.dart';

//Entry Point
void main() {
  runApp(const GrowerApp());
}

//Root Widget
class GrowerApp extends StatelessWidget {
  const GrowerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Grower Club',
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromARGB(255, 62, 122, 80)
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color.fromARGB(255, 131, 153, 126),
          labelColor: Color.fromARGB(255, 235, 242, 250)
        )
      ),
      home: const HomePage(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
        child: TabBar(
        indicatorColor: Colors.transparent,
        indicator: null,
        dividerColor: Colors.transparent,
        tabs: <Widget>[
          Tab(
            text: "Ankündigungen",
            icon: Icon(
              Icons.message_outlined
            ),
          ),
          Tab(
            text: "Angebot",
            icon: Icon(Icons.menu_book_outlined)
          ),
          Tab(
            text: "Account",
            icon: Icon(Icons.account_circle_outlined)
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('(LOGO HERE)'),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Übersicht von bevorstehenden Events"),
            ),
            Center(
              child: Text("Pflanzen Angebot"),
            ),
            Center(
              child: Text("Account Verwaltung"),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavBar(),
        ),
      ),
    );
  }
}
