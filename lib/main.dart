import 'package:flutter/material.dart';
import 'package:taxis/pages/login/login_pages.dart';
import 'package:taxis/pages/login/logout_pages.dart';
import 'package:taxis/pages/register/register_pages.dart';
import 'package:taxis/pages/sales/add_taxi_done_page.dart';
import 'package:taxis/pages/sales/sales_report_page.dart';
import 'package:taxis/pages/sales/add_for_page.dart';
import 'package:taxis/pages/sales/add_laundry_page.dart';
import 'package:taxis/pages/sales/add_laundry_done_page.dart';
import 'package:taxis/pages/sales/add_taxi_page.dart';

void main() {
  runApp(const MyApp());
}

final routes = {
  '/': (context) => const LoginPage(),
  '/login': (context) => const LoginPage(),
  '/logout': (context) => const LogoutPage(),
  '/register': (context) => const Register(),
  '/salesreport': (context) => const SalesReportPage(),
  '/addfor': (context) => const AddForPage(),
  '/addlaundry': (context) => const AddLaundryPage(),
  '/addlaundrydone': (context) => const AddLaundryDonePage(),
  '/addtaxi': (context) => const AddTaxiPage(),
  '/addtaxidone': (context) => const AddTaxiDonePage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A fleet of Taxis',
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
        ),
      ),
      routes: routes,
    );
  }
}
