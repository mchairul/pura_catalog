import 'package:flutter/material.dart';
import 'package:pura_catalog/home.dart';
import 'package:pura_catalog/about.dart';
import 'package:pura_catalog/Products.dart';
import 'package:pura_catalog/appbar.dart';
import 'package:pura_catalog/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void changeStateBottomNavBar (index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final ScrollController scrollController = ScrollController();

  //sebagain acuan widget konten
  static final List<Widget> _contentWidget = <Widget>[
    ContentHome(),
    ContentAbout(),
    HalamanProducts(),
    ContentContact(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: _contentWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "About"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Product"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: "Contact"
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: (index) {
          //merubah state variable
          changeStateBottomNavBar(index);
        },
      ),
    );
  }
}
