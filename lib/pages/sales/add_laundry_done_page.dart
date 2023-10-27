import 'package:flutter/material.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxis/pages/global_variables.dart';
import 'package:taxis/pages/components/app_bar.dart';

class AddLaundryDonePage extends StatefulWidget {
  const AddLaundryDonePage({Key? key}) : super(key: key);
  @override
  State<AddLaundryDonePage> createState() => _AddLaundryPageState();
}

class _AddLaundryPageState extends State<AddLaundryDonePage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title1: 'Status ', title2: '(Laundary)'),
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
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        checkColor: Colors.black,
                        activeColor: Colors.blue,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors
                                  .green; // Customize the fill color when checkbox is checked
                            }
                            return Colors
                                .black; // Customize the fill color when checkbox is unchecked
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        '25%',
                        style: TextStyle(
                            color: firstColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        'Discount',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        checkColor: Colors.black,
                        activeColor: Colors.blue,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors
                                  .green; // Customize the fill color when checkbox is checked
                            }
                            return Colors
                                .black; // Customize the fill color when checkbox is unchecked
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Free Wash',
                        style: TextStyle(
                            color: firstColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        '(10 Times Buy)',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
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
                        Navigator.pushNamed(context, '/addlaundrydone');
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
