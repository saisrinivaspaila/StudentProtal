import 'package:flutter/material.dart';
import './entities/model.dart';

class MenuPage extends StatefulWidget {
  final Student model;
  MenuPage(this.model);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final menu = [
    "Your Details",
    "Check Attendance",
    "Check Aggregate",
    "Predict Attendance",
    "Change Password"
  ];
  _MenuPageState();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    if (widget.model.loginStatus == true) {
      return Scaffold(
          backgroundColor: Color(0xfff5f7ff),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 90.0,
                ),
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "images/Vignan_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
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
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/studentDetails');
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Color(0xff3949ab),
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewAttendance');
                  },
                  child: Text("${menu[1]}",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xff3949ab),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/aggregate');
                  },
                  child: Text("${menu[2]}",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xff3949ab),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/predictAttendance');
                  },
                  child: Text("${menu[3]}",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xff3949ab),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/changePass');
                  },
                  child: Text("${menu[4]}",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  padding: EdgeInsets.all(10.0),
                  color: Color(0xff3949ab),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    widget.model.onLogout();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text("Log Out",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 300.0,
                  ),
                  Text(
                      "Incorrect Password\nPlease check your Registration id and Password",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    hoverElevation: 3.0,
                    elevation: 1.0,
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xff3949ab),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      widget.model.onLogout();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text("Click here to login again",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
