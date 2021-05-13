import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire99/Screens/Login/login_screen.dart';
import 'package:fire99/Screens/Signup/components/background.dart';
import 'package:fire99/components/already_have_an_account_acheck.dart';
import 'package:fire99/components/rounded_button.dart';
import 'package:fire99/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String valuechoose;

  void initState()
  {
    super.initState();
    setState(() {

    });
  }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _countrycontroller = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();

  TextEditingController _dateofbirth = TextEditingController();

  TextEditingController _gender = TextEditingController();
  File _userImageFile;

  void _pickedImage(File pickedImage){
    _userImageFile=pickedImage;
  }

  @override
  void dispose()
  {
    _namecontroller.dispose();

    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    _countrycontroller.dispose();

    _phonenumber.dispose();

    _dateofbirth.dispose();

    _gender.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(

              padding: const EdgeInsets.only(top:60.0),
              child: Text(
                "SIGNUP",
                style:(TextStyle(fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontFamily: 'Pacifico',
                fontSize: 30,
                letterSpacing: 2,
              )
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              controller: _namecontroller,

              hintText: "Your Email",
              onChanged: (value) {},

            ),
            RoundedPasswordField(
              controller: _passwordcontroller,

              onChanged: (value) {},
            ),
            RoundedButton(


              text: "SIGN UP",
              press: ()  async {
                if (_formkey.currentState.validate()) {
                  var result = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _emailcontroller.text,
                      password: _passwordcontroller.text);
                  if (result != null) {
                    Firestore.instance.collection('users').document(
                        result.user.uid).setData({
                      'username': _namecontroller.text,
                      'email': _emailcontroller.text,
                    });
                  }
                }
              }

            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
