import 'package:flutter/material.dart';
import 'package:goddoro/home/homeViewModel.dart';
import 'package:goddoro/profile.dart';
import 'package:goddoro/search.dart';
import 'package:goddoro/search/searchViewModel.dart';
import 'package:provider/provider.dart';
import 'package:ui/component/typography.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'School',
          ),
        ],
      ),
      body: <Widget>[
         ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
          child: const HomeView(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) => SearchViewModel(),
          child: const SearchView(),
        ),
        const ProfileView(),
      ][currentPageIndex],
    );
  }
}


