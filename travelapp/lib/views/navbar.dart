// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/views/feed_food.dart';
import 'package:travelapp/views/feed_poi.dart';
import 'package:travelapp/views/feed_hotel.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  List<Widget> pageList = [
    FeedPage(),
    FeedPageHotel(),
    FeedPageFood(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: pageList.elementAt(selectedIndex)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: DotNavigationBar(
          borderRadius: 50,
          itemPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          margin: EdgeInsets.only(left: 10, right: 10),
          backgroundColor: Colors.black87.withOpacity(0.4),
          unselectedItemColor: Colors.grey[300],
          selectedItemColor: Colors.blue.shade200,
          items: [
            DotNavigationBarItem(
              icon: Icon(
                Icons.beach_access_sharp,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.hotel_rounded,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.fastfood_sharp,
                size: 35,
              ),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
