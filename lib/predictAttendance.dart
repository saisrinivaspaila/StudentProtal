import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

class PredictAttendance extends StatefulWidget {
  final Student model;
  PredictAttendance(this.model);
  @override
  _PredictAttendanceState createState() => _PredictAttendanceState();
}

class _PredictAttendanceState extends State<PredictAttendance> {
  final _holidayCount = TextEditingController();

  double _predicted;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  @override
  Widget build(BuildContext context) {
    if (widget.model.attendance == null) {
      return Scaffold(
          backgroundColor: Color(0xfff5f7ff),
          body: Center(
            child: Card(
              color: Color(0xfff5f7ff),
              child: ListView(
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
                    height: 90.0,
                  ),
                  Text(
                    'Attendance info is not updated',
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
                  ),
                ],
              ),
            ),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: Center(
        child: Card(
          color: Color(0xfff5f7ff),
          child: ListView(
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
                height: 90.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("No of leaves you are expected to keep",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _holidayCount,
                  // obscureText: true,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Leave Count",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff3949ab), width: 1.0),
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Color(0xff3949ab),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text("Predict my attendance",
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    if (_holidayCount.text != "") {
                      _predicted = double.parse(((widget.model.classesAttended /
                                  (widget.model.classesConducted +
                                      8 * int.parse(_holidayCount.text))) *
                              100)
                          .toStringAsFixed(2));
                    } else {
                      _predicted = widget.model.attendance;
                    }
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              predictAtt(_predicted),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget predictAtt(double _predicted) {
    if (_predicted != null) {
      return Text("Perdicted Attendance = $_predicted",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold));
    } else {
      return Text("");
    }
  }
}
