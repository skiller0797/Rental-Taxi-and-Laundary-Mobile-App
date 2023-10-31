import 'package:flutter/material.dart';

class SalesReportPanel extends StatelessWidget {
  final String title;
  final String amount;
  final String count;
  final String loads;
  final Color background;

  const SalesReportPanel(
      {super.key,
      required this.title,
      required this.amount,
      required this.count,
      required this.loads,
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
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Orders: ${count}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                'Loads: $loads',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/orderlist');
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black, // Set the desired icon color here
                  ))
            ],
          )
        ],
      ),
    );
  }
}
