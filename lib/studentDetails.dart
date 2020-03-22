import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  final Student model;
  StudentDetails(this.model);
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
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
              Text("Name = " + widget.model.name,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("regId = " + widget.model.regId,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Mobile Number = " + widget.model.mobileNumber,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Attendance = ${widget.model.attendace}",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
