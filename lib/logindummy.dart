import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './entities/model.dart';
import 'loginPage.dart';

class Logindummy extends StatefulWidget {
  Logindummy({Key key, this.model}) : super(key: key);
  final String title="";
  final Student model;

  @override
  _LogindummyState createState() => _LogindummyState(model:model);
}

class _LogindummyState extends State<Logindummy> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  final Student model;

  _LogindummyState({this.model});

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Admission NO.",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final password = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          LoginPage();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 35.0,
                  ),//add media query for this one
                  SizedBox(
                    height: 35.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "images/Vignan_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(
                    height: 35.0,
                  ),password,
                  SizedBox(height: 45.0),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
        )
    );
  }
}