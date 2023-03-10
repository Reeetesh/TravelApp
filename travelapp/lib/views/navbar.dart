import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/views/favourites.dart';
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
    const FeedPage(),
    const FeedPageHotel(),
    const FeedPageFood(),
    const Favourites()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: pageList.elementAt(selectedIndex)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: DotNavigationBar(
          borderRadius: 25,
          itemPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          margin: const EdgeInsets.only(left: 10, right: 10),
          backgroundColor: Colors.grey.shade300.withOpacity(0.8),
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.indigo.shade400,
          items: [
            DotNavigationBarItem(
              icon: const Icon(
                Icons.beach_access_sharp,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: const Icon(
                Icons.hotel_rounded,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
              icon: const Icon(
                Icons.fastfood_sharp,
                size: 35,
              ),
            ),
            DotNavigationBarItem(
                icon: const Icon(
              Icons.favorite_outline,
              size: 35,
            ))
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
