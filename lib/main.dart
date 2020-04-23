import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:minipro/changepasswd.dart';
import 'package:minipro/menuPage.dart';
import 'package:minipro/predictAttendance.dart';
// import 'package:minipro/menuPage.dart';
import 'aggregate.dart';
import 'loginPage.dart';
import 'studentDetails.dart';
import 'package:scoped_model/scoped_model.dart';
import './entities/model.dart';
// import './menuPage.dart';
import "./viewAttendance.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 7),
            Text(
              'Made With',
              style: TextStyle(
                  fontSize: 20.0,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 7),
            Icon(Icons.favorite, color: Colors.redAccent),
            SizedBox(width: 7),
            Text(
              'Flutter',
              style: TextStyle(
                  fontSize: 20.0,
                  wordSpacing: 2.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final Student _model = Student();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Student>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/studentDetails': (BuildContext context) => StudentDetails(_model),
          '/viewAttendance': (BuildContext context) =>
              AttendanceDetails(_model),
          '/aggregate': (BuildContext context) => AggregateDetails(_model),
          '/predictAttendance': (BuildContext context) =>
              PredictAttendance(_model),
          '/menuPage': (BuildContext context) => MenuPage(_model),
          '/login': (BuildContext context) => LoginPage(_model),
          '/changePass': (BuildContext context) => ChangePass(_model),
        },
        home: AppHome(
          model: _model,
        ),
      ),
    );
  }
}

class AppHome extends StatelessWidget {
  final model;

  AppHome({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: LoginPage(model),
      //  bro this is your login page----> LoginPage(),
    );
  }
}
// return Container(

//   // decoration: BoxDecoration(
//   //   image: DecorationImage(

//   //       image: AssetImage('images/Vignan_logo.png'),
//   //       fit: BoxFit.contain
//   //   ) ,
//   // ),
//   // child: Center(
//   //   child: CircularProgressIndicator(
//   //     valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
//   //   ),
//   // ),
// );
