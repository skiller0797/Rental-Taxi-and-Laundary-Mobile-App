import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

int _selectedIndex = 0;

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0x000C0B0C),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green, // Set the selected item color
      unselectedItemColor: Colors.white, // Set the unselected item color
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Color(0xFF424141), // Set your desired background color here
              ),
              padding: const EdgeInsets.all(15), // Adjust the padding as needed
              child: const FaIcon(FontAwesomeIcons
                  .dollarSign), // Replace with your desired icon
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Color(0xFF424141), // Set your desired background color here
              ),
              padding: const EdgeInsets.all(12), // Adjust the padding as needed
              child: const FaIcon(
                  FontAwesomeIcons.user), // Replace with your desired icon
            ),
            label: 'User'),
        BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Color(0xFF424141), // Set your desired background color here
              ),
              padding: const EdgeInsets.all(12), // Adjust the padding as needed
              child: const FaIcon(
                  FontAwesomeIcons.plus), // Replace with your desired icon
            ),
            label: 'Add')
      ],
    );
  }

  void _onItemTapped(int index) {
    // Update the UI to display the selected page
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, '/salesreport');
          break;
        case 1:
          Navigator.pushNamed(context, '/logout');
          break;
        case 2:
          Navigator.pushNamed(context, '/addfor');
          break;
      }
    });
  }
}
