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
      backgroundColor: Color(0xfff5f7ff),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Attendance: ${widget.model.attendace} %",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Classes Attended: ${widget.model.classesAttended}",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Classes Conducted: ${widget.model.classesConducted}",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 100.0,
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
    );
  }
}
