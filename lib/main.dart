import 'package:flutter/material.dart';
import 'package:minipro/changepasswd.dart';
import 'package:minipro/menuPage.dart';
import 'package:minipro/predictAttendance.dart';
// import 'package:minipro/menuPage.dart';
import 'loginPage.dart';
import 'studentDetails.dart';
import 'package:scoped_model/scoped_model.dart';
import './entities/model.dart';
// import './menuPage.dart';
import "./viewAttendance.dart";

void main() => runApp(MyApp());

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
