import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final PageController pageController;
  NavBar({this.pageController});

  _NavState createState() => _NavState();
}

class _NavState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _currentIndex,
      iconSize: 25,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
            backgroundColor: Colors.cyan),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('explore'),
            backgroundColor: Colors.yellow),
        BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            title: Text('post'),
            backgroundColor: Colors.red),
        BottomNavigationBarItem(
            icon: Icon(Icons.pregnant_woman),
            title: Text('profile'),
            backgroundColor: Colors.green),
      ],
      onTap: _onTapped,
    );
  }

  void _onTapped(int index) {
    widget.pageController.jumpToPage(index);
    setState(() => _currentIndex = index);
  }
}
