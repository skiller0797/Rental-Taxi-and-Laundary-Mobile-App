import 'package:flutter/material.dart';
import 'package:taxis/pages/global_variables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 150,
                      //decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(40),
                      //border: Border.all(color: Colors.blueGrey)),
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 35,
                          child: FloatingActionButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/register');
                            },
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            focusColor: Colors.green,
                            child: const Text('Login'),
                            shape: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Set the color for the bottom border
                                width: 2, // Set the width for the bottom border
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 35,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            child: const Text('Signup'),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 8, bottom: 8, left: 8),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        hintText: 'Email',
                        // labelText: 'Email or Phone number',
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
                        return 'Please enter your email';
                      }
                      return null;
                    },
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
                        // labelText: 'Password',
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
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: rememberMe,
                        onChanged: (val) {
                          setState(() {
                            rememberMe = val!;
                          });
                        }),
                    const Text('Remember Me'),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ],
                )),
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
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // Navigate the user to the Home page
                          Navigator.pushNamed(context, '/salesreport');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill input')),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    ));
  }
}
