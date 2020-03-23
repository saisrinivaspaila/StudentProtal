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
        // backgroundColor: Color(0xff3949ab),
      ),
      backgroundColor: Color(0xfff5f7ff),
      body: Center(
        child: Card(
          color: Color(0xfff5f7ff),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300.0,
              ),
              ButtonTheme(
                minWidth: 500.0,
                height: 50.0,
                child: RaisedButton(
                  color:  Color(0xfff5f7ff),
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  hoverColor: Color(0xffffffff),
                  highlightColor: Color(0xff3949ab),
                  onPressed: () {},
                  child: Text(
                      "Attendance = ${widget.model.attendace}\nClasses Attended = ${widget.model.classesAttended}\nClasses Conducted = ${widget.model.classesConducted}",
                      textAlign: TextAlign.left,
                      style: style.copyWith(
                          color:  Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
