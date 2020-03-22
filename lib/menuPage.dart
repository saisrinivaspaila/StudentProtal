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
    "Predict Attendace"
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
    final _height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: _height / 4),
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
                      ));
              },
            )
          ],
        ),
      ),
    );
  }
}
