import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

List backlogInfo = [];
List gradePerSem = [];
List semestergpa = [];
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class AggregateDetails extends StatefulWidget {
  final Student model;
  AggregateDetails(this.model);

  @override
  _AggregateDetailsState createState() => _AggregateDetailsState();
}

class _AggregateDetailsState extends State<AggregateDetails> {
  Widget build(BuildContext context) {
    setsemestergpa();
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
          Text(
            'Semesters Agregate',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: semestergpa.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: RaisedButton(
                  color: Color(0xff3949ab),
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  // padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    child: Text(
                      '${semestergpa[index][0]} : ${semestergpa[index][1]}',
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    if (semestergpa[index][0] != "Backlogs" &&
                        semestergpa[index][0] != "Total GPA") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterData(index),
                        ),
                      );
                    }
                  },
                ),
              );
            },
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
                    backlogInfo.clear();
                    gradePerSem.clear();
                    semestergpa.clear();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setsemestergpa() {
    int count = 0;
    double val = 0;
    widget.model.backlogInfo.forEach((key, value) {
      backlogInfo.add(value);
      count += value;
    });

    widget.model.gradesInEachSem.forEach((key, value) {
      gradePerSem.add(value);
    });

    widget.model.cgpaInfo.forEach((key, value) {
      semestergpa.add(["Semester " + key, value]);
      val += value;
    });
    semestergpa.add(["Backlogs", count]);
    if (count == 0) {
      semestergpa.add([
        "Total GPA",
        double.parse(((val / widget.model.cgpaInfo.length)).toStringAsFixed(2))
      ]);
    } else {
      semestergpa.add(["Total GPA", 0]);
    }
  }
}

class SemesterData extends StatefulWidget {
  final int index;
  SemesterData(this.index);

  @override
  _SemesterDataState createState() => _SemesterDataState(index);
}

class _SemesterDataState extends State<SemesterData> {
  final int index;
  _SemesterDataState(this.index);
  Map semGrade = {};
  List subjAndGrade = [];
  @override
  Widget build(BuildContext context) {
    // semWiseGradeExtract();
    semGrade = gradePerSem[index];
    semGrade["Backlogs"] = backlogInfo[index];
    semGrade["Semester CGPA"] = semestergpa[index][1];
    semGrade.forEach((key, value) {
      subjAndGrade.add([key, value]);
    });

    return Scaffold(
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

          Text(
            '${semestergpa[index][0]} results',
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20.0),

          ListView.builder(
            shrinkWrap: true,
            itemCount: subjAndGrade.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: RaisedButton(
                  color: Color(0xff3949ab),
                  hoverElevation: 3.0,
                  elevation: 1.0,
                  // padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: ListBody(
                    children: [
                      Text(
                        '${subjAndGrade[index][0]} - ${subjAndGrade[index][1]}',
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (semestergpa[index][0] != "Backlogs" &&
                        semestergpa[index][0] != "Total GPA") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterData(index),
                        ),
                      );
                    }
                  },
                ),
              );
            },
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
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
