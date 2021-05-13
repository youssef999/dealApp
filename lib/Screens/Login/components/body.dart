import 'package:flutter/material.dart';
import 'package:fire99/Screens/Login/components/background.dart';
import 'package:fire99/Screens/Signup/signup_screen.dart';
import 'package:fire99/components/already_have_an_account_acheck.dart';
import 'package:fire99/components/rounded_button.dart';
import 'package:fire99/components/rounded_input_field.dart';
import 'package:fire99/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire99/register2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire99/screen.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formkey,

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "LOGIN",

                  style: TextStyle(fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: _emailcontroller,

                hintText: "Your Email",

                onChanged: (value) {

                },

              ),
              RoundedPasswordField(
                controller: _passwordcontroller,

                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async{
                  if(_formkey.currentState.validate()){

                    WidgetsFlutterBinding.ensureInitialized();
                    await Firebase.initializeApp();

                    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);

                    final user = FirebaseAuth.instance.currentUser;
                    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
                    String ud=userData['username'];
                    if(result != null)
                    {
                      // pushReplacement
                      print('welcomee');
                      Navigator. pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => screen(ud)),
                      );

                    }
                    else{
                      // show msg box in future
                      print('user not found');
                    }
                  }

                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

