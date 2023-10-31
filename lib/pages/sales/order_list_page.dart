import 'package:flutter/material.dart';
import 'package:taxis/pages/components/app_bar.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';

// ignore: depend_on_referenced_packages
class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);
  @override
  State<OrderListPage> createState() => _AddTaxiPageState();
}

class ListPanel extends StatelessWidget {
  final String fullname;
  final String phonenumber;
  final String count;

  const ListPanel(
      {required this.fullname, required this.phonenumber, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullname,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            phonenumber,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            count,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddTaxiPageState extends State<OrderListPage> {
  bool isChecked = false;
  final List<Map<String, String>> panelData = [
    {
      'title': 'John Doe',
      'subtitle': '+123456789',
    },
    {
      'title': 'John Doe',
      'subtitle': '+123456789',
    },
    {
      'title': 'John Doe',
      'subtitle': '+123456789',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Status ',
        title2: '(Taxi)',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: panelData.length,
        itemBuilder: (context, index) {
          String fullname = panelData[index]['title']!;
          String phonenumber = panelData[index]['subtitle']!;
          String count = panelData[index]['subtitle']!;

          return ListPanel(
            fullname: fullname,
            phonenumber: phonenumber,
            count: count,
          );
        },
        separatorBuilder: (context, index) {
          // Define the spacing between list items
          return const SizedBox(height: 16);
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
