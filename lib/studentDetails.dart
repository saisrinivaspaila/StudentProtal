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
      backgroundColor: Color(0xfff5f7ff),
      body: ListView(
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
                Text("Name: " + widget.model.name,
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Regestration Number: " + widget.model.regId,
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Year: ${widget.model.year}",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Section: ${widget.model.section}",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Mobile Number: " + widget.model.mobileNumber,
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Attendance: ${widget.model.attendace} %",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.0,
                ),
                Text("Email: ${widget.model.mailId} ",
                    textAlign: TextAlign.left,
                    style: style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 50.0,
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
          )
        ],
      ),
    );
  }
}
