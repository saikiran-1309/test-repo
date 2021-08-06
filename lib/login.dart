import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isHiddenPassword = true;
  bool isPasswordCheck = false;
  bool isUserNameCheck = false;

  TextEditingController _usernameTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

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
    super.initState();
  }

  @override
  void dispose() {
    _passwordTEC.dispose();
    _usernameTEC.dispose();
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
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/bvrit_logo.png',
                      height: height * 0.18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'Welcome to ',
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.1),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                children: [
                  Text('BVRIT ',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.1),
                      )),
                  Text(
                    'V Connect',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'A single stop for fun joy and \nlearning!',
                style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.045,
                  color: Colors.grey,
                )),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'U S E R  N A M E',
                style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color:
                      isUserNameCheck == true ? Colors.blue : Colors.grey[700],
                )),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: TextFormField(
                      controller: _usernameTEC,
                      decoration: InputDecoration(),
                      validator: MinLengthValidator(3, errorText: 'errorText'),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.0),
                        child: Text(
                          'P A S S W O R D',
                          style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: isPasswordCheck == true
                                ? Colors.blue
                                : Colors.grey[700],
                          )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: TextFormField(
                      controller: _passwordTEC,
                      obscureText: _isHiddenPassword,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                if (_isHiddenPassword == true) {
                                  _isHiddenPassword = false;
                                } else {
                                  _isHiddenPassword = true;
                                }

                                setState(() {});
                              },
                              child: Icon(
                                _isHiddenPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ))),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password cant be empty'),
                        MinLengthValidator(8,
                            errorText:
                                'Password should be atleast 8 characters ')
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.grey, fontSize: width * 0.045),
                    ),
                    alignment: Alignment.centerRight,
                  )),
            ),
            SizedBox(
              height: height * 0.065,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.26),
              child: MaterialButton(
                height: height * 0.08,
                minWidth: width * 0.05,
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: () {
                  var _username = _usernameTEC.text;
                  var _password = _passwordTEC.text;

                  if (formkey.currentState!.validate()) {
                    print('LOGIN CREDENTIALS.....');
                    print('user name : ' + _username);
                    print('password : ' + _password);
                  }
                },
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 14),
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
