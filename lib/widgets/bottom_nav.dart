import 'package:flutter/material.dart';
import 'package:myjpj/pages/homepage.dart';
import 'package:myjpj/pages/notification.dart';
import 'package:myjpj/pages/profile.dart';
import 'package:myjpj/routings.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation(
      {super.key, required this.token, required this.selectedIndex});

  final String token;
  final int selectedIndex;

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  navigateTo(int index) {
    switch (index) {
      case 0:
        Routings.onTapLink(context, MyHomePage(token: widget.token));
        break;
      case 1:
        Routings.onTapLink(context, NotificationPage(token: widget.token));
        break;
      case 2:
        Routings.onTapLink(context, ProfilePage(token: widget.token));
        break;
      default:
        Routings.onTapLink(context, MyHomePage(token: widget.token));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        onTap: (value) {
          navigateTo(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Laman Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Natifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ]);
  }
}
