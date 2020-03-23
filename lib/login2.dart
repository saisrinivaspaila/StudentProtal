import 'package:flutter/material.dart';
import './entities/model.dart';

class PassPage extends StatefulWidget {
  final Student model;
  PassPage(this.model);

  @override
  _PassPageState createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  final passw = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    passw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(children: <Widget>[
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
              SizedBox(height: 45.0),
              TextField(
                controller: passw,
                obscureText: true,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 35.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xff3949ab),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    widget.model.loginCheck(passw.text);
                    Navigator.pushReplacementNamed(context, '/menuPage');
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => MenuPage(model)));
                  },
                  child: Text("Login",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Color(0xfff5f7ff),
                          fontWeight: FontWeight.bold)),
                ),
              )
            ])));
  }
}
