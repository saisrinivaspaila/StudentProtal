import 'package:flutter/material.dart';
import './entities/model.dart';
import './login2.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  final Student model;
  LoginPage(this.model);
  @override
  _LoginPageState createState() => _LoginPageState(model);
}

class _LoginPageState extends State<LoginPage> {
  //  final _height = MediaQuery.of(context).size.height;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final model;
  final username = TextEditingController();
  _LoginPageState(this.model);

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    username.dispose();
    super.dispose();
  }

  @override
  void initState() {
    username.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: username,
      // obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Admission Number",
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff3949ab), width: 0.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff3949ab),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (username.text == "") {
            username.text = "nothing";
          }
          if (await (widget.model.fetchRegNo(username.text)) == true) {
            // print(username.text);
            // print(widget.model.loginStatus);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PassPage(model)));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PassPage(model)));
          }
        },
        child: Text("Click here to continue",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color(0xfff5f7ff), fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        backgroundColor: Color(0xfff5f7ff),
        body: ScopedModelDescendant(
            builder: (BuildContext context, Widget widget, Student model) {
          return model.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Center(
                    child: Container(
                      color: Color(0xfff5f7ff),
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 90.0,
                              ), //add media query for this on
                              SizedBox(
                                height: 100.0,
                                child: Image.asset(
                                  "images/Vignan_logo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 45.0),
                              emailField,
                              SizedBox(
                                height: 35.0,
                              ),
                              loginButon,
                              SizedBox(
                                height: 200.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        }));
  }
}
