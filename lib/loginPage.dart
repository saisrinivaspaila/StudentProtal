import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './entities/model.dart';

class LoginPage extends StatefulWidget {
  final Student model;

  LoginPage(this.model);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    widget.model.fetchRegNo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: _height / 4),
        child: Column(
          children: <Widget>[
            Text('Please enter your login credentials'),
            SizedBox(
              height: 20,
            ),
            ScopedModelDescendant(
              builder: (BuildContext context, Widget widget,
                  Student model) {
                return model.isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text(
                          'Login'),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/studentDetails');
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
