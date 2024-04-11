import 'package:eat_more/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:eat_more/widget/widget_support.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black,
                      Color(0xFF154C79),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5),
                height: MediaQuery.of(context).size.height / 1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("images/EatmoreLogo.png",
                          width: MediaQuery.of(context).size.width / 1.5,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(height: 50.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            SizedBox(height: 30.0),
                            Text("Sign up",
                                style: AppWidget.HeadlineTextFieldStyle()),
                            SizedBox(height: 30.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: Icon(Icons.person_outlined),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                prefixIcon: Icon(Icons.password_outlined),
                              ),
                            ),
                            SizedBox(height: 80.0),
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text("SIGN UP",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text("Allready have an account? Login",
                          style: AppWidget.regularTextFieldStyle()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
