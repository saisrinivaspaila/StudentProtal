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
        
       backgroundColor:Colors.purple[50],
      ),
      backgroundColor:Color(0xfff5f7ff),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            minWidth: 500.0,
            height: 50.0,
            child: RaisedButton(
              color:Color(0xfff5f7ff),
              hoverColor: Color(0xffffffff),
              hoverElevation: 3.0, highlightColor: Color(0xff3949ab),
              elevation: 1.0,
              // padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              child: Text("Name:" + widget.model.name,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: 500.0,
            height: 50.0,
            child: RaisedButton(
              color:Color(0xfff5f7ff),
              hoverColor: Color(0xffffffff),
              hoverElevation: 3.0, highlightColor: Color(0xff3949ab),
              elevation: 1.0,
              // padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              child: Text("regId:" + widget.model.regId,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: 500.0,
            height: 50.0,
            child: RaisedButton(
              color:Color(0xfff5f7ff),

              hoverElevation: 3.0,
              elevation: 1.0,
              hoverColor: Color(0xffffffff),
              highlightColor: Color(0xff3949ab),
              // padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              child: Text("Mobile Number:" + widget.model.mobileNumber,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: 500,
            height: 50.0,
            child: RaisedButton(
              color:Color(0xfff5f7ff),
              hoverColor: Color(0xffffffff),
              hoverElevation: 3.0, highlightColor: Color(0xff3949ab),
              elevation: 1.0,
              // padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
              child: Text("Attendance : ${widget.model.attendace}%",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
