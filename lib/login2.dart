import 'package:flutter/material.dart';
import './entities/model.dart';

class PassPage extends StatefulWidget {
  final Student model;
  PassPage(this.model);

  @override
  _PassPageState createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  final passw = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    passw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    if (widget.model.loginStatus == true) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff5f7ff),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
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

                  SizedBox(height: 45.0),

                  Text("Welcome " + widget.model.name,
                      textAlign: TextAlign.left,
                      style: style.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),

                  SizedBox(height: 20.0),

                  TextField(
                    controller: passw,
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff3949ab), width: 0.0),
                            borderRadius: BorderRadius.circular(32.0))),
                  ),

                  SizedBox(
                    height: 35.0,
                  ),

                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff3949ab),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        widget.model.loginCheck(passw.text);

                        Navigator.pushReplacementNamed(context, '/menuPage');

                        // Navigator.push(context,

                        // MaterialPageRoute(builder: (context) => MenuPage(model)));
                      },
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Color(0xfff5f7ff),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

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
          ],
        ),
      );
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
                  Text("Please check your Registration Number",
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
