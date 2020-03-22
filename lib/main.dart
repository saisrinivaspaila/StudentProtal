import 'package:flutter/material.dart';
import 'package:minipro/menuPage.dart';
import 'logindummy.dart';
import 'studentDetails.dart';
import 'package:scoped_model/scoped_model.dart';
import './entities/model.dart';
import './menuPage.dart';

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
          '/menuPage': (BuildContext context) => MenuPage(_model)
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
      body:LoginPage(),
      //  bro this is your login page----> LoginPage(),
    );
  }
}
