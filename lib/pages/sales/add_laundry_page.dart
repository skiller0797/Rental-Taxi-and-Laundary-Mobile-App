import 'package:flutter/material.dart';
import 'package:taxis/pages/components/app_bar.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';
import 'package:taxis/pages/components/add_laundary_form_builder.dart';

class AddLaundryPage extends StatefulWidget {
  const AddLaundryPage({Key? key}) : super(key: key);
  @override
  State<AddLaundryPage> createState() => _AddLaundryPageState();
}

class MyCustomText extends StatelessWidget {
  final String title;
  const MyCustomText({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.bold),
        ));
  }
}

class MyCustomInput extends StatelessWidget {
  final String hintText;
  const MyCustomInput({super.key, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        margin: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          style:
              const TextStyle(color: Colors.black, height: 1.0, fontSize: 10.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey, // Set the desired hint text color
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ));
  }
}

//dropdownlist
class _AddLaundryPageState extends State<AddLaundryPage> {
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

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Add ',
        title2: 'Laundary',
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
              child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FormAddLaundary(),
                    ],
                  )),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
