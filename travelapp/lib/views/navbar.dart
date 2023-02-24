// ignore_for_file: prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
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
    Icon(
      Icons.favorite_outlined,
      size: 150,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: pageList.elementAt(selectedIndex)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: DotNavigationBar(
          enableFloatingNavBar: true,
          enablePaddingAnimation: true,
          backgroundColor: Colors.grey[600]!.withOpacity(0.5),
          marginR: EdgeInsets.symmetric(horizontal: 75, vertical: 15),
          margin: EdgeInsets.only(left: 10, right: 10),
          dotIndicatorColor: Colors.black,
          unselectedItemColor: Colors.grey[300],
          items: [
            DotNavigationBarItem(
              icon: Image.asset(
                "assets/beach.png",
                height: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: Icon(
                Icons.hotel_rounded,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: Image.asset(
                "assets/favourite.png",
                height: 35,
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
