import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

class AttendanceDetails extends StatefulWidget {
  final Student model;
  AttendanceDetails(this.model);
  @override
  _AttendanceDetailsState createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3949ab),
      ),
      backgroundColor: Color(0xfff5f7ff),
      body: Center(
        child: Card(
          color: Color(0xfff5f7ff),
          child: Column(
            children: <Widget>[
              Text("Classes Attended = ${widget.model.classesAttended}",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Classes Conducted = {widget.model.classesConducted}",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Attendance = ${widget.model.attendace}",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              
            ],
          ),
        ),
      ),
    );
  }
}
