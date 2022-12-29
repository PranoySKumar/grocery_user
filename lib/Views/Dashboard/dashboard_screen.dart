import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Views/Dashboard/FavouritesScreen/favourites_screen.dart';

import '../../Controllers/connection_manager_controller.dart';
import 'HomeScreen/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final _index = 0.obs;
  final _isGuest = GetStorage().read<String>("token") != null ? false : true;
  final _screens = [const HomeScreen(), const FavouritesScreen()];

  DashboardScreen({super.key});

//sets the index of the selected screen.
  _setIndex(int value) {
    _index.value = value;
  }

  @override
  Widget build(BuildContext context) {
    ConnectionManager.init();
    if (_isGuest) {
      return const Scaffold(body: HomeScreen());
    }

    return Obx(() => Scaffold(
          body: _screens[_index.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.cottage_outlined),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.window_outlined),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_outlined),
                label: '',
              ),
            ],
            currentIndex: _index.value,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.yellow[800],
            onTap: _setIndex,
          ),
        ));
  }
}
