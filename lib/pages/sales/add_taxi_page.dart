import 'package:flutter/material.dart';
import 'package:taxis/pages/components/add_taxi_form_builder.dart';
import 'package:taxis/pages/components/app_bar.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';

class AddTaxiPage extends StatefulWidget {
  const AddTaxiPage({Key? key}) : super(key: key);
  @override
  State<AddTaxiPage> createState() => _AddTaxiPageState();
}

//dropdownlist
class _AddTaxiPageState extends State<AddTaxiPage> {
  // final List<Widget> _pages = [
  //   HomePage(),
  //   NotificationsPage(),
  //   ProfilePage(),
  // ];

  String selectedDiscountValue = '0';
  List<String> discountListItems = <String>['0', '25%', '50%', '75%', '100%'];

  String selectedMachineValue = 'Option 1';
  List<String> selectedMachineItems = <String>[
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Add ',
        title2: 'Taxi',
      ),
      body: Center(
        child: Container(
          // height: 800.0,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20, bottom: 5),
                child: FormAddTaxi()),
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
