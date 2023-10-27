import 'package:flutter/material.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';
import 'package:taxis/pages/components/app_bar.dart';

class AddForPage extends StatefulWidget {
  const AddForPage({Key? key}) : super(key: key);
  @override
  State<AddForPage> createState() => _AddForPageState();
}

class _AddForPageState extends State<AddForPage> {
  // final List<Widget> _pages = [
  //   HomePage(),
  //   NotificationsPage(),
  //   ProfilePage(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Add For',
        title2: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.green,
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                      ),
                      child: Row(
                        children: [
                          const Text('Add to laundry'),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors
                                  .transparent, // Replace with the desired background color
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 2,
                              ), // Adjust the border radius as needed
                            ),
                            child: const Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Colors
                                  .black, // Replace with the desired icon color
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addlaundry');
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(255, 214, 76, 34),
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: const Text('Add to Taxi'),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors
                                  .transparent, // Replace with the desired background color
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 2,
                              ), // Adjust the border radius as needed
                            ),
                            child: const Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: Colors
                                  .black, // Replace with the desired icon color
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/addtaxi');
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
