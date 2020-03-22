import 'package:flutter/material.dart';
import './entities/model.dart';
import 'package:scoped_model/scoped_model.dart';

class MenuPage extends StatefulWidget {
  final Student model;
  final _regId;
  final _pass;
  MenuPage(this.model, this._regId, this._pass);

  @override
  _MenuPageState createState() => _MenuPageState(_regId, _pass);
}

class _MenuPageState extends State<MenuPage> {
  final menu = [
    "Your Details",
    "Check Attendance",
    "Check Marks",
    "Predict Attendace",
    "Change Password"
  ];
  final _regId, _pass;
  _MenuPageState(this._regId, this._pass);

  @override
  void initState() {
    widget.model.fetchRegNo(_regId, _pass);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: _height/4),
          child: Column(
            children: <Widget>[
              ScopedModelDescendant(
                builder: (BuildContext context, Widget widget, Student model) {
                  return model.isLoading
                      ? CircularProgressIndicator()
                      : Expanded(
                          child: ListView(
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xff3949ab),
                              onPressed: () {
                                Navigator.pushNamed(context, '/studentDetails');
                              },
                              child: Text("${menu[0]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              color: Color(0xff3949ab),
                              onPressed: () {},
                              child: Text("${menu[1]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              color: Color(0xff3949ab),
                              onPressed: () {},
                              child: Text("${menu[2]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              color: Color(0xff3949ab),
                              onPressed: () {},
                              child: Text("${menu[3]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              color: Color(0xff3949ab),
                              onPressed: () {},
                              child: Text("${menu[4]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
