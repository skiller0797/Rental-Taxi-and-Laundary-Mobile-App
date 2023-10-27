import 'package:flutter/material.dart';
import 'package:taxis/pages/components/socialmediabar.dart';
import 'package:taxis/pages/global_variables.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

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
                            child: const Text(
                              'Signup',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Set the color for the bottom border
                                width: 2, // Set the width for the bottom border
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 8, bottom: 8, left: 8),
                  child: TextFormField(
                    // validator: MultiValidator([
                    // RequiredValidator(errorText: 'Enter first named'),
                    // MinLengthValidator(3,
                    // 	errorText: 'Minimum 3 charecter filled name'),
                    // ]),
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
                        return 'Please enter your email.';
                      } else if (!value.contains('@') || !value.contains('.')) {
                        return 'Invaild email.';
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
                        return 'Please enter your password.';
                      } else if (value.length < 8) {
                        return 'Must be more than 8 letters.';
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
                        return 'Not match.';
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
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // Navigate the user to the Home page
                          Navigator.pushNamed(context, '/login');
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
