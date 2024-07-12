import 'package:flutter/material.dart';
import 'package:flutter_practice_yt/pages/profile.dart';
import 'package:flutter_practice_yt/pages/settingspage.dart';

import 'homepage.dart';

class FirstPage extends StatefulWidget {
   FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectind=0;
  void _navigatebar(int index)
  {
    setState(() {
      _selectind=index;
    });
  }


final List _page=[
  // HomePage(),
  ProfilePage(),
  SettingPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("First Page"),),


      body:_page[_selectind],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectind,
        onTap: _navigatebar,

    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settins'),
    ],
    ),
    );
  }
}
