import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  final Student model;
  StudentDetails(this.model);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
      ),
      body: Column(
        children: <Widget>[
          Text("Name = " + widget.model.name),
          Text("regId = " + widget.model.regId),
          Text("Mobile Number = " + widget.model.mobileNumber),
          Text("Attendance = ${widget.model.attendace}")
        ],
      ),
    );
  }
}
