import 'package:flutter/material.dart';
import 'package:taxis/pages/components/app_bar.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddTaxiDonePage extends StatefulWidget {
  const AddTaxiDonePage({Key? key}) : super(key: key);
  @override
  State<AddTaxiDonePage> createState() => _AddTaxiPageState();
}

class _AddTaxiPageState extends State<AddTaxiDonePage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Status ',
        title2: '(Taxi)',
      ),
      body: Center(
        child: Container(
            // height: 800.0,
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Center(
                  child: IconButton(
                    padding: const EdgeInsets.only(top: 80),
                    onPressed: () {
                      // Handle on tap action for the Facebook button
                    },
                    icon: const FaIcon(FontAwesomeIcons.checkCircle),
                    color: Colors.green,
                    iconSize: 200,
                  ),
                ),
                const Center(
                  child: Text(
                    'Successfully Added!!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 55),
                    width: 150,
                    height: 50,
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.only(left: 55, right: 15)),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Done',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          ]),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addtaxidone');
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
