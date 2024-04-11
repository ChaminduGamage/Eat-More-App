import 'package:eat_more/pages/signup.dart';
import 'package:eat_more/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            SizedBox(height: 30.0),
                            Text("Login",
                                style: AppWidget.HeadlineTextFieldStyle()),
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
                            SizedBox(height: 20.0),
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password?",
                                style: AppWidget.semiBoldTextFieldStyle(),
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
                                  child: Text("LOGIN",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text("Don't have an account?Sign Up",
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
