import 'package:flutter/material.dart';
import 'package:taxis/pages/components/app_bar.dart';
import 'package:taxis/pages/components/bottom_navbar.dart';
import 'package:taxis/pages/components/sales_report_panel.dart';
import 'package:taxis/pages/global_variables.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({Key? key}) : super(key: key);
  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  // final List<Widget> _pages = [
  //   HomePage(),
  //   NotificationsPage(),
  //   ProfilePage(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Sales',
        title2: '',
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SalesReportPanel(
                title: 'Today',
                amount: 'P 999999',
                background: Colors.white,
              ),
              SalesReportPanel(
                title: '7 days',
                amount: 'P 999999',
                background: Color(0xFFFBA38F),
              ),
              SalesReportPanel(
                title: '30 days',
                amount: 'P 999999',
                background: thirdColor,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
