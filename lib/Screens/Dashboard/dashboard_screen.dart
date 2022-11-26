import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomeScreen/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final _index = 0.obs;
  final _screens = [const HomeScreen()];
  DashboardScreen({super.key});

//sets the index of the selected screen.
  _setIndex(int value) {
    _index.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => _screens[_index.value])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cottage_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: '',
          ),
        ],
        currentIndex: _index.value,
        selectedItemColor: Colors.amber[800],
        onTap: _setIndex,
      ),
    );
  }
}
