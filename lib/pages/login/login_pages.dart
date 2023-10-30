import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:taxis/pages/global_variables.dart';
import 'package:taxis/pages/api/restful.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();

  bool _rememberMe = false;

  String res = '';
  bool connected = false;

  @override
  void initState() {
    super.initState();
    _getStoredCredentials();
  }

  Future<void> _getStoredCredentials() async {
    final email = await secureStorage.read(key: 'email');
    final password = await secureStorage.read(key: 'password');
    final rememberMe = await secureStorage.read(key: 'rememberMe');
    // ... process the cookie value
    if (email != null && password != null && rememberMe == 'true') {
      setState(() {
        emailController.text = email;
        passwordController.text = password;
        _rememberMe = true;
      });
    }
  }

// Call the async function
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

    res =
        await login(emailController.text, passwordController.text, _rememberMe);
    for (int i = 0; i <= 300; i++) {
      /// You don't need to update state, just pass the value.
      /// Only value required
      pd.update(value: i);
      i++;
      if (i >= 100) {
        connected = true;
      }
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
                            shape: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .white, // Set the color for the bottom border
                                width: 2, // Set the width for the bottom border
                              ),
                            ),
                            child: const Text('Login'),
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
                        value: _rememberMe,
                        onChanged: (val) {
                          setState(() {
                            _rememberMe = val!;
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
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          res = await _normalProgress(context);
                          // Navigator.of(context).pop();
                          if (res == 'invalidInfo') {
                            //ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid user info')),
                            );
                            // ignore: use_build_context_synchronously
                            // Fluttertoast.showToast(
                            //     msg: 'Invalid user info',
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 12.0);
                          } else if (res == 'notRegistered') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('User not registered')),
                            );
                          } else if (res == 'passwordIncorrect') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Password incorrect')),
                            );
                          } else if (res == 'loginSuccess') {
                            if (connected) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed("/salesreport");
                            }
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
                          // Navigator.pushNamed(context, '/salesreport');
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
