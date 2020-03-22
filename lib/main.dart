import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'studentDetails.dart';
import 'package:scoped_model/scoped_model.dart';
import './entities/model.dart';

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
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginPage(model),
    );
  }
}
