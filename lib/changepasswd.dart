import 'package:flutter/material.dart';
import 'package:minipro/entities/model.dart';

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
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  int check = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
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
          RaisedButton(
            hoverElevation: 3.0,
            elevation: 1.0,
            padding: EdgeInsets.all(10.0),
            color: Color(0xff3949ab),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              setState(() {
                if (oldpass.text == widget.model.pass) {
                  if (newpass.text == cnewpass.text) {
                    widget.model.setPass(newpass.text);
                    Navigator.pushReplacementNamed(context, '/menuPage');
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
          output1(check),
        ],
      ),
    );
  }

  Widget output1(check) {
    if (check == 0) {
      return Text("");
    } else if (check == 1) {
      return Text(
        "Old password is wrong",
        style: style,
      );
    } else if (check == 2) {
      return Text(
        "New password and confirm password fields should be matched",
        style: style,
      );
    } else {
      return Text("");
    }
  }
}
