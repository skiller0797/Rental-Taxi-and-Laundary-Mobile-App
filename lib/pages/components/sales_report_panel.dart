import 'package:flutter/material.dart';

class SalesReportPanel extends StatelessWidget {
  final String title;
  final String amount;
  final Color background;

  const SalesReportPanel(
      {super.key,
      required this.title,
      required this.amount,
      required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      margin: const EdgeInsets.only(bottom: 10),
      height: 130,
      decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Image.asset('assets/left.png'),
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 40,
                child: Image.asset('assets/right.png'),
              ),
            ],
          ),
          Row(children: [
            Text(
              amount,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ]),
          const Row(
            children: [
              Text(
                'balance',
                style: TextStyle(color: Colors.black, fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
