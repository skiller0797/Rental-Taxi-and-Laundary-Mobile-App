import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // Handle on tap action for the Facebook button
            },
            icon: const FaIcon(FontAwesomeIcons.apple),
            color: Colors.white,
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              // Handle on tap action for the Twitter button
            },
            icon: const FaIcon(FontAwesomeIcons.facebook),
            color: Colors.white,
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              // Handle on tap action for the Instagram button
            },
            icon: const FaIcon(FontAwesomeIcons.twitter),
            color: Colors.white,
            iconSize: 40,
          ),
          IconButton(
            onPressed: () {
              // Handle on tap action for the LinkedIn button
            },
            icon: const FaIcon(FontAwesomeIcons.google),
            color: Colors.white,
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
