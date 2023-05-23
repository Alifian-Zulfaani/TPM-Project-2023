import 'package:flutter/material.dart';
import 'menu.dart';
import 'profile.dart';
import 'kesan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  Widget bodyFunction() {
    switch (_page) {
      case 0:
        return MenuPage();
        break;
      case 1:
        return ProfilePage();
        break;
      case 2:
        return KesanPage();
        break;
      default:
        return Container(color: Colors.white);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFunction(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Kesan dan Saran',
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}