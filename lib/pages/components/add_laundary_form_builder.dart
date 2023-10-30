import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:taxis/pages/api/restful.dart';
import 'package:taxis/pages/global_variables.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: must_be_immutable
class FormAddLaundary extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<String> machineItems = ['Option 1', 'Option 2', 'Option 3'];
  List<String> discountItems = ['0 %', '25 %', '50 %', '75 %', '100 %'];

  TextEditingController customernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController soapController = TextEditingController();

  final secureStorage = const FlutterSecureStorage();

  double fieldHeight = 45;
  double fieldLeftPadding = 15;
  String phonenumber = '';
  String res = '';
  String selectedMachine = 'Option 1';
  String selectedDiscount = '0 %';

  String email = '';

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

    res = await addloundary(
        customernameController.text,
        phonenumber,
        weightController.text,
        soapController.text,
        selectedMachine,
        selectedDiscount,
        email);
    for (int i = 0; i <= 10000; i++) {
      /// You don't need to update state, just pass the value.
      /// Only value required
      pd.update(value: i);
      i++;
    }
    pd.close();
    return res;
  }

  Future<void> _getEmail() async {
    email = (await secureStorage.read(key: 'email'))!;
  }

  FormAddLaundary({super.key});

  @override
  Widget build(BuildContext context) {
    _getEmail();
    return FormBuilder(
      key: _formKey,
      child: Wrap(
        runSpacing: 10,
        children: [
          SizedBox(
              height: fieldHeight,
              child: FormBuilderTextField(
                controller: customernameController,
                cursorColor: Colors.green,
                name: 'fullname',
                style: const TextStyle(
                  fontSize: 15.0, // Customize font size
                  color: Colors.black, // Customize font color
                ),
                decoration: InputDecoration(
                  labelText: 'Customer Name',
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                  contentPadding: EdgeInsets.only(
                      top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                  hintText: 'John Doe',
                  hintStyle: const TextStyle(
                    // Customize font style
                    fontSize: 10.0, // Customize font size
                    // Customize font weight
                    color: Colors.grey, // Customize font color
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color:
                              Colors.black), // Customize enabled border color
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2), // Customize focused border color
                      borderRadius: BorderRadius.circular(15.0)),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red), // Customize error border color
                  ),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                ),
                onChanged: (val) {
                  _formKey.currentState!.fields['fullname']!.validate();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              )),
          SizedBox(
              height: 60,
              child: Theme(
                data: ThemeData(
                  textTheme: const TextTheme(
                    titleMedium: TextStyle(
                        color: Colors
                            .black), // Set the font color of the country code
                  ),
                ),
                child: IntlPhoneField(
                  cursorColor: firstColor,
                  showCountryFlag: true,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                Colors.black), // Customize enabled border color
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2), // Customize focused border color
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Customize error border color
                    ),
                    errorStyle:
                        const TextStyle(color: Colors.red, fontSize: 10),
                  ),
                  onChanged: (value) {
                    phonenumber = value.completeNumber;
                  },
                ),
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderTextField(
                cursorColor: Colors.green,
                name: 'weight',
                controller: weightController,
                style: const TextStyle(
                  fontSize: 15.0, // Customize font size
                  color: Colors.black, // Customize font color
                ),
                decoration: InputDecoration(
                  labelText: 'Weights',
                  labelStyle: const TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.only(
                      top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                  hintText: 'kg',
                  hintStyle: const TextStyle(
                    fontSize: 10.0, // Customize font size
                    color: Colors.grey, // Customize font color
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Colors.black), // Customize enabled border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2), // Customize focused border color
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red), // Customize error border color
                  ),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                ),
                onChanged: (val) {
                  _formKey.currentState!.fields['weight']!.validate();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderTextField(
                cursorColor: Colors.green,
                name: 'soap',
                controller: soapController,
                style: const TextStyle(
                  fontSize: 15.0, // Customize font size
                  color: Colors.black, // Customize font color
                ),
                decoration: InputDecoration(
                  labelText: 'Soap & Extra',
                  labelStyle: const TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.only(
                      top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                  hintText: 'Soap & Extra',
                  hintStyle: const TextStyle(
                    fontSize: 10.0, // Customize font style
                    color: Colors.grey, // Customize font color
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Colors.black), // Customize enabled border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2), // Customize focused border color
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red), // Customize error border color
                  ),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                ),
                onChanged: (val) {
                  _formKey.currentState!.fields['soap']!.validate();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // FormBuilderValidators.email(),
                ]),
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderDropdown(
                name: 'machine',
                style: const TextStyle(color: Colors.black),
                items: machineItems.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                    labelText: 'Machine Use',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color:
                              Colors.black), // Customize enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color:
                              Colors.black), // Customize focused border color
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Customize error border color
                    )),
                onChanged: (val) {
                  _formKey.currentState!.fields['machine']!.validate();
                  selectedMachine = val!;
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // FormBuilderValidators.email(),
                ]),
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.black,
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderDropdown(
                name: 'discount',
                style: const TextStyle(color: Colors.black),
                items: discountItems.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                    labelText: 'Discount',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color:
                              Colors.black), // Customize enabled border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color:
                              Colors.black), // Customize focused border color
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), // Customize error border color
                    )),
                onChanged: (val) {
                  _formKey.currentState!.fields['discount']!.validate();
                  selectedDiscount = val!;
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // FormBuilderValidators.email(),
                ]),
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.black,
              )),
          const Padding(
            padding: EdgeInsets.only(
              left: 0.0,
              top: 10,
            ),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Subtotal: ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          backgroundColor: secondColor)),
                  TextSpan(
                      text: "P 500.00",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Submit'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      res = await _normalProgress(context);
                      // Navigator.of(context).pop();
                      if (res == 'invalidInfo') {
                        //ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid user info')),
                        );
                      } else if (res == 'insertedSuccess') {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed("/addlaundrydone");
                      } else if (res == 'connectionFailed') {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Connection Failed')),
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
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
