import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:taxis/pages/components/socialmediabar.dart';
import 'package:taxis/pages/global_variables.dart';
import 'package:taxis/pages/api/restful.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

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

    res = await signup(
        fullnameController.text, emailController.text, passwordController.text);
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 35,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            backgroundColor: Colors.transparent,
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        height: 35,
                        child: FloatingActionButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/register');
                            },
                            backgroundColor: Colors.transparent,
                            shape: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Set the color for the bottom border
                                width: 2, // Set the width for the bottom border
                              ),
                            ),
                            child: const Text(
                              'Signup',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 8, bottom: 8, left: 8),
                  child: TextFormField(
                    controller: fullnameController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        hintText: 'Fullname',
                        hintStyle: TextStyle(
                          color: Colors.grey, // Set the desired hint text color
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(950)))),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your fullname';
                      }
                      return null;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey, // Set the desired hint text color
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(950)))),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@') || !value.contains('.')) {
                        return 'Invaild email';
                      }
                      return null;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        hintText: 'Password',
                        // labelText: 'Pass0word',
                        hintStyle: TextStyle(
                          color: Colors.grey, // Set the desired hint text color
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Must be more than 8 letters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        hintText: 'Confirm Password',
                        // labelText: 'Confirm Password',
                        hintStyle: TextStyle(
                          color: Colors.grey, // Set the desired hint text color
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password.';
                      } else if (value != passwordController.text) {
                        return 'Password not match.';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
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
                      child: const Text('Singup'),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          res = await _normalProgress(context);
                          if (res == 'invalidInfo') {
                            //ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid user info')),
                            );
                          } else if (res == 'alreadExist') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('User already registered')),
                            );
                          } else if (res == 'databaseError') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Database error')),
                            );
                          } else if (res == 'createdSuccess') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Created successfully. Please log in')),
                            );
                          } else if (res == 'connectionFailed') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Connection Failed')),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Unkwon error')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill input')),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Center(
                    child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('or'),
                )),
                const Center(
                  child: SocialMediaBar(),
                )
              ],
            )),
      ),
    ));
  }
}
