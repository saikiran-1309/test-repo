import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _pass1TEC = TextEditingController();
  TextEditingController _pass2TEC = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;
  bool ispasswordcheck = false;
  bool isconfirmpasswordcheck = false;

  void _checkPassword() {
    setState(() {
      if (ispasswordcheck == false) {
        ispasswordcheck = true;
      }
      if (_pass1TEC.text == '') {
        ispasswordcheck = false;
      }
    });
  }

  void _checkConfirmPassword() {
    setState(() {
      if (isconfirmpasswordcheck == false) {
        isconfirmpasswordcheck = true;
      }
      if (_pass2TEC.text == '') {
        isconfirmpasswordcheck = false;
      }
    });
  }

  @override
  void initState() {
    _pass1TEC.addListener(_checkPassword);
    _pass2TEC.addListener(_checkConfirmPassword);
    super.initState();
  }

  @override
  void dispose() {
    _pass1TEC.dispose();
    _pass2TEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Text(
                            '< BACK',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/bvrit_logo.png',
                    height: height * 0.18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Text(
                  'Reset Password',
                  style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: TextFormField(
                        controller: _pass1TEC,
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                            labelText: "N E W  P A S S W O R D",
                            labelStyle: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: ispasswordcheck == true
                                  ? Colors.blue
                                  : Colors.grey[700],
                            )),
                            suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'password can\'t be empty'),
                          MinLengthValidator(8,
                              errorText: 'Password should be 8 characters')
                        ])),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: TextFormField(
                        controller: _pass2TEC,
                        obscureText: isHiddenConfirmPassword,
                        decoration: InputDecoration(
                          labelText: "C O N F I R M  N E W  P A S S W O R D",
                          labelStyle: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isconfirmpasswordcheck == true
                                ? Colors.blue
                                : Colors.grey[700],
                          )),
                          suffixIcon: InkWell(
                              onTap: _toggleConfirmPasswordView,
                              child: Icon(
                                isHiddenConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              )),
                        ),
                        validator: (val) {
                          if (val != _pass1TEC.text)
                            return "Password must be same as above";
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Center(
              child: Container(
                  child: Image.asset(
                'assets/reset_password.jpg',
                width: width * 0.8,
                height: height * 0.28,
              )),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.18),
              child: MaterialButton(
                height: height * 0.08,
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  var _pass1 = _pass1TEC.text;
                  var _pass2 = _pass2TEC.text;

                  if (formkey.currentState!.validate()) {
                    print('pass1 : ' + _pass1);
                    print('pass2 : ' + _pass2);
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }
}
