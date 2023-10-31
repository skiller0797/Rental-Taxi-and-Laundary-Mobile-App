import 'package:flutter/material.dart';
import 'package:taxis/pages/api/restful.dart';
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
  Map<String, dynamic> salesData = {};
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<String> fetchData() async {
    // Simulating an asynchronous request
    final responsData = await getSalesData();
    setState(() {
      salesData = {
        'Today': {
          'subkey': 'today',
          'amount': '₱ 999999',
          'count': responsData['todayCount'].toString(),
          'loads': responsData['todayLoads'].toString(),
          'background': Colors.white,
        },
        '7 days': {
          'subkey': 'week',
          'amount': '₱ 999999',
          'count': responsData['weekCount'].toString(),
          'loads': responsData['weekLoads'].toString(),
          'background': const Color(0xFFFBA38F),
        },
        '30 days': {
          'subkey': 'month',
          'amount': '₱ 999999',
          'count': responsData['monthCount'].toString(),
          'loads': responsData['monthLoads'].toString(),
          'background': thirdColor,
        },
      };
    });

    return 'Data from the request';
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> salesReportPanels = salesData.entries.map((entry) {
      String title = entry.key;
      String amount = entry.value['amount'];
      String count = entry.value['count'];
      String loads = entry.value['loads'];
      Color background = entry.value['background'];

      return SalesReportPanel(
        title: title,
        amount: amount,
        count: count,
        loads: loads,
        background: background,
      );
    }).toList();
    return Scaffold(
      appBar: AppBarWidget(
        title1: 'Sales',
        title2: '',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: salesReportPanels),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
