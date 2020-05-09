import 'package:flutter/material.dart';
import 'package:minipro/entities/model.dart';
// import 'package:slide_button/slide_button.dart';
import 'dart:convert';

class ChangePass extends StatefulWidget {
  final Student model;
  ChangePass(this.model);
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final oldpass = TextEditingController(),
      newpass = TextEditingController(),
      cnewpass = TextEditingController();
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Color(0xff3949ab),
    wordSpacing: 1.0,
  );
  int check = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ), //add media query for this on
          SizedBox(
            height: 100.0,
            child: Image.asset(
              "images/Vignan_logo.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          TextField(
            controller: oldpass,
            obscureText: true,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Old Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: newpass,
            obscureText: true,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "New Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: cnewpass,
            obscureText: true,
            style: style,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Confirm New Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            hoverElevation: 3.0,
            elevation: 1.0,
            padding: EdgeInsets.all(10.0),
            color: Color(0xff3949ab),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              setState(() {
                var pass = oldpass.text + "getLostToDecrypt";
                var bytes = utf8.encode(pass);
                pass = base64.encode(bytes);
                pass = pass.substring(0, pass.length - 2);
                pass = pass.substring(0, 6) +
                    '${widget.model.mobileNumber[5]}${widget.model.mobileNumber[1]}' +
                    'gO19' +
                    '${widget.model.mobileNumber[9]}Da&d_${widget.model.mobileNumber[2]}=1' +
                    pass.substring(6, pass.length);
                if (pass == widget.model.pass) {
                  if (newpass.text == cnewpass.text) {
                    if ((newpass.text).length > 8) {
                      widget.model.setPass(newpass.text);
                      Navigator.pushReplacementNamed(context, '/menuPage');
                    } else {
                      check = 3;
                    }
                  } else {
                    check = 2;
                  }
                } else {
                  check = 1;
                }
              });
            },
            child: Text("Change Password",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(child: output1(check)),
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            child: Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Color(0xff3949ab),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Color(0xfff5f7ff),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }

  Widget output1(check) {
    if (check == 0) {
      return Text("");
    } else if (check == 1) {
      return Text(
        "*Old password is wrong",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Colors.red,
          wordSpacing: 1.0,
        ),
      );
    } else if (check == 2) {
      return Text(
        "*New password and confirm password fields should be matched",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Colors.red,
          wordSpacing: 1.0,
        ),
      );
    } else if (check == 3) {
      return Text(
        "*Make sure that password length is greater than 8",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
          color: Colors.red,
          wordSpacing: 1.0,
        ),
      );
    } else {
      return Text("");
    }
  }
}
