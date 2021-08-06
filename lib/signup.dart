import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _usernameTEC = TextEditingController();
  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  bool isPasswordCheck = false;
  bool isUserNameCheck = false;
  bool isEmailCheck = false;

  void _checkPassword() {
    setState(() {
      if (isPasswordCheck == false) {
        isPasswordCheck = true;
      }
      if (_passwordTEC.text == '') {
        isPasswordCheck = false;
      }
    });
  }

  void _checkEmail() {
    setState(() {
      if (isEmailCheck == false) {
        isEmailCheck = true;
      }
      if (_emailTEC.text == '') {
        isEmailCheck = false;
      }
    });
  }

  void _checkUserName() {
    setState(() {
      if (isUserNameCheck == false) {
        isUserNameCheck = true;
      }
      if (_usernameTEC.text == '') {
        isUserNameCheck = false;
      }
    });
  }

  @override
  void initState() {
    _passwordTEC.addListener(_checkPassword);
    _usernameTEC.addListener(_checkUserName);
    _emailTEC.addListener(_checkEmail);
    super.initState();
  }

  @override
  void dispose() {
    _passwordTEC.dispose();
    _usernameTEC.dispose();
    _emailTEC.dispose();
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
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.03,
                ),
                Image.asset(
                  'assets/bvrit_logo.png',
                  height: height * 0.18,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Sign up to ',
              style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.1)),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'BVRIT ',
                    style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.1)),
                  ),
                  Text(
                    'V Connect',
                    style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.1)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'N A M E',
                          style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isUserNameCheck == true
                                ? Colors.blue
                                : Colors.grey[700],
                          )),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                      controller: _usernameTEC,
                      decoration: InputDecoration(),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'usernmae can\'t be empty'),
                        MinLengthValidator(3,
                            errorText:
                                'username should be atleast 3 characters long'),
                      ])),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'E M A I L',
                          style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isEmailCheck == true
                                ? Colors.blue
                                : Colors.grey[700],
                          )),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: _emailTEC,
                    decoration: InputDecoration(
                      hintText: "Please sign up with your college email ID",
                      hintStyle: TextStyle(
                          fontSize: width * 0.033, color: Colors.black),
                      hintTextDirection: TextDirection.rtl,
                    ),
                    validator: MultiValidator([
                      EmailValidator(errorText: 'invalid email'),
                      MinLengthValidator(13, errorText: 'email can\'t be empty')
                    ]),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'P A S S W O R D',
                          style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isPasswordCheck == true
                                ? Colors.blue
                                : Colors.grey[700],
                          )),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                      controller: _passwordTEC,
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              if (isHiddenPassword == true) {
                                isHiddenPassword = false;
                              } else {
                                isHiddenPassword = true;
                              }
                              setState(() {});
                            },
                            child: Icon(
                              isHiddenPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            )),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Password can\'t be empty'),
                        MinLengthValidator(8,
                            errorText: 'Password should be 8 characters'),
                      ])),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Column(
              children: [
                MaterialButton(
                  height: height * 0.08,
                  minWidth: width * 0.5,
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    var _username = _usernameTEC.text;
                    var _email = _emailTEC.text;
                    var _password = _passwordTEC.text;
                    if (formkey.currentState!.validate()) {
                      print('SIGN UP CREDENTIALS.....');
                      print('username : ' + _username);
                      print('email : ' + _email);
                      print('password : ' + _password);
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 14),
                          )),
                      SizedBox(
                        height: height * 0.003,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
