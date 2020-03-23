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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3949ab),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Card(
          color: Color(0xfff5f7ff),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              Text("No of leaves you are expected to keep",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _holidayCount,
                // obscureText: true,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Day Count",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Color(0xff3949ab),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text("Predict my attendance",style: style.copyWith(
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
                      _predicted = widget.model.attendace;
                    }
                  });
                },
              ),
              predictAtt(_predicted),
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
