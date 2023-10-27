import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;
  final Widget? leading;

  AppBarWidget({required this.title1, required this.title2, this.leading});

  void handleNavigation(String value, BuildContext context) {
    // Perform navigation based on the selected value
    if (value == 'Option 1') {
      Navigator.pushNamed(context, '/register');
    } else if (value == 'Option 2') {
      Navigator.pushNamed(context, '/register');
    } else if (value == 'Option 3') {
      Navigator.pushNamed(context, '/register');
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        Text(title1, style: const TextStyle(color: Colors.white)),
        Text(title2, style: const TextStyle(color: Colors.green)),
      ]),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Insert your back button logic here
          Navigator.pop(context);
        },
      ),
      actions: [
        PopupMenuButton<String>(
          color: Colors.white,
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white, // Set the desired icon color here
          ),
          offset: const Offset(0, 50),
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text(
                  'Option 1',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text(
                  'Option 2',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Option 3',
                child: Text(
                  'Option 3',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ];
          },
          onSelected: (String value) {
            handleNavigation(value,
                context); // Perform the desired action based on the selected value
          },
        ),
      ],
    );
  }
}
