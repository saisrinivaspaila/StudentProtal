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
    final double circleRadius = 150.0;
    final double circleBorderWidth = 8.0;
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: circleRadius,
                height: circleRadius,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(circleBorderWidth),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                            ))),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('fill-ur-name',
              style: style.copyWith(
                  color: Color(0xff3949ab), fontWeight: FontWeight.w900)),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: ScopedModelDescendant(
              builder: (BuildContext context, Widget widget, Student model) {
                return model.isLoading
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: ListView(
                          children: <Widget>[
                            RaisedButton(
                              color: Color(0xff3949ab),
                              hoverElevation: 3.0,
                              elevation: 1.0,
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Text("${menu[0]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.pushNamed(context, '/studentDetails');
                              },
                            ),
                            RaisedButton(
                              color: Color(0xff3949ab),
                              hoverElevation: 3.0,
                              elevation: 1.0,
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {},
                              child: Text("${menu[1]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              hoverElevation: 3.0,
                              elevation: 1.0,
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff3949ab),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {},
                              child: Text("${menu[2]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              hoverElevation: 3.0,
                              elevation: 1.0,
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff3949ab),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {},
                              child: Text("${menu[3]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            RaisedButton(
                              hoverElevation: 3.0,
                              elevation: 1.0,
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff3949ab),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {},
                              child: Text("${menu[4]}",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
          FloatingActionButton(
            foregroundColor: Color(0xfff5f7ff),
            backgroundColor: Color(0xff3949ab),
            hoverElevation: 5.0,
            elevation: 4.0,
            splashColor: Colors.lightBlue[600],
            onPressed: () {},
            child: Text(
              "Logout",
              style: TextStyle(
                color: Color(0xfff5f7ff),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          )
        ],
      ),
    );
  }
}
