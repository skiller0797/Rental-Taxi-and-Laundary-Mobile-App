import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:taxis/pages/components/bottom_navbar.dart';
import 'package:taxis/pages/global_variables.dart';
import 'package:taxis/pages/api/restful.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);
  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final _formkey = GlobalKey<FormState>();
  String res = '';

  _normalProgress(context) async {
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd.show(
        max: 100,
        msg: 'Connecting...',
        progressType: ProgressType.valuable,
        backgroundColor: Colors.grey,
        progressValueColor: const Color(0xff3550B4),
        progressBgColor: Colors.transparent,
        msgColor: Colors.white,
        barrierDismissible: true,
        hideValue: true,
        valueColor: Colors.white);

    res = await logout();
    for (int i = 0; i <= 100; i++) {
      /// You don't need to update state, just pass the value.
      /// Only value required
      pd.update(value: i);
      i++;
    }
    pd.close();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Image.asset(
                          'assets/banner.png',
                          width: 200,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: ClipOval(
                          child: SizedBox(
                            width: 150,
                            // height: 150,
                            child: Image.asset(
                              'assets/avatar_default.jpg',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                  Center(
                      child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'John Smith',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
                  Center(
                      child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'johnsimth9902@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      margin: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: thirdColor,
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: const Text('Logout'),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/login');
                          res = await _normalProgress(context);
                          // Navigator.of(context).pop();
                          if (res == 'loggedout') {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed("/login");
                          } else if (res == 'connectionFailed') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Connection failed')),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Unkwon error')),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
