import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_form_builder/flutter_form_builder.dart';
// ignore: depend_on_referenced_packages
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:taxis/pages/global_variables.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_field/intl_phone_field.dart';

// ignore: must_be_immutable
class FormAddTaxi extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  double fieldHeight = 45;
  double fieldLeftPadding = 15;

  FormAddTaxi({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          SizedBox(
              height: fieldHeight,
              child: FormBuilderTextField(
                cursorColor: Colors.green,
                name: 'driver',
                style: const TextStyle(
                  fontSize: 15.0, // Customize font size
                  color: Colors.black, // Customize font color
                ),
                decoration: InputDecoration(
                  labelText: 'Driver',
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
                  _formKey.currentState!.fields['driver']!.validate();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              )),
          // SizedBox(
          //     height: fieldHeight,
          //     child: FormBuilderTextField(
          //       name: 'phonenumber',
          //       initialValue: '+1',
          //       style: TextStyle(
          //         fontSize: 15.0, // Customize font size
          //         color: Colors.black, // Customize font color
          //       ),
          //       decoration: InputDecoration(
          //         labelText: 'Phone Number',
          //         labelStyle: TextStyle(color: Colors.black, fontSize: 15),
          //         contentPadding: EdgeInsets.only(
          //             top: 2, right: 2, bottom: 0, left: fieldLeftPadding),
          //         hintText: '169324987457',
          //         hintStyle: TextStyle(
          //           fontSize: 10.0, // Customize font size
          //           color: Colors.grey, // Customize font color
          //         ),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(15.0)),
          //         enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(
          //                 color:
          //                     Colors.black), // Customize enabled border color
          //             borderRadius: BorderRadius.circular(15.0)),
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15.0),
          //           borderSide: BorderSide(
          //               color: Colors.green,
          //               width: 2), // Customize focused border color
          //         ),
          //         errorBorder: OutlineInputBorder(
          //           borderSide: BorderSide(
          //               color: Colors.red), // Customize error border color
          //         ),
          //         errorStyle: TextStyle(color: Colors.red, fontSize: 10),
          //       ),
          //       onChanged: (val) {
          //         _formKey.currentState!.fields['phonenumber']!.validate();
          //       },
          //       validator: FormBuilderValidators.compose([
          //         FormBuilderValidators.required(),
          //         FormBuilderValidators.numeric(),
          //       ]),
          //     )),
          SizedBox(
              height: 70,
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
                  onChanged: (phoneNumber) {
                    print(phoneNumber.completeNumber);
                  },
                ),
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderTextField(
                cursorColor: Colors.green,
                name: 'regnum',
                style: const TextStyle(
                  fontSize: 15.0, // Customize font size
                  color: Colors.black, // Customize font color
                ),
                decoration: InputDecoration(
                  labelText: 'Registration No',
                  labelStyle: const TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.only(
                      top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                  hintText: '',
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
                  _formKey.currentState!.fields['regnum']!.validate();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              )),
          SizedBox(
              height: fieldHeight,
              child: FormBuilderDropdown(
                name: 'rentrate',
                style: const TextStyle(color: Colors.black),
                items: const [
                  DropdownMenuItem(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  // Add more options as needed
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                    labelText: 'Rent Rate',
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
                  _formKey.currentState!.fields['rentrate']!.validate();
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
                name: 'dayfee',
                style: const TextStyle(color: Colors.black),
                items: const [
                  DropdownMenuItem(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  // Add more options as needed
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 2, right: 2, bottom: 2, left: fieldLeftPadding),
                    labelText: 'Day Fee',
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
                  _formKey.currentState!.fields['dayfee']!.validate();
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
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  debugPrint(_formKey.currentState?.value.toString());

                  // On another side, can access all field values without saving form with instantValues
                  _formKey.currentState?.validate();
                  debugPrint(_formKey.currentState?.instantValue.toString());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
