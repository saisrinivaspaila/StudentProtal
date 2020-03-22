import 'package:flutter/material.dart';
import './entities/model.dart';

class MenuPage extends StatefulWidget {
  final Student model;
  MenuPage(this.model);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final menu = [
    "Your Details",
    "Check Attendance",
    "Check Marks",
    "Predict Attendace"
  ];
  String _regId = "17L31A0501";

  @override
  void initState() {
    widget.model.fetchRegNo(_regId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/studentDetails');
          },
          child: Text("${menu[0]}"),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("${menu[1]}"),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("${menu[2]}"),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("${menu[3]}"),
        ),
      ],
    );
  }
}
