import 'package:minipro/entities/model.dart';
import 'package:flutter/material.dart';

List semesters = [];
List backlogInfo = [];
List gradePerSem = [];
List<dynamic> semestergpa = [];
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
    print(widget.model.backlogInfo);
    print(widget.model.cgpaInfo);
    print(widget.model.gradesInEachSem);
    print(semestergpa.length);
    return Scaffold(
      backgroundColor: Color(0xfff5f7ff),
      body: Container(
        child: ListView.builder(
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
                    '${semesters[index]}: ${semestergpa[index]}',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterData(index),
                    ),
                  );
                },
              ),
            );
          },
        ),
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
    print(backlogInfo);

    widget.model.gradesInEachSem.forEach((key, value) {
      gradePerSem.add(value);
    });
    print(gradePerSem);
    widget.model.cgpaInfo.forEach((key, value) {
      semesters.add("Semester " + key);
      semestergpa.add(value);
      val += value;
    });
    print(semestergpa);
    semesters.add("Backlog Count");
    semestergpa.add(count);
    print(semestergpa);
    semesters.add("Total GPA");
    if (count == 0) {
      semestergpa.add(double.parse(
          ((val / widget.model.cgpaInfo.length)).toStringAsFixed(2)));
    } else {
      semestergpa.add(0);
    }

    print(semestergpa);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: semestergpa.length,
          itemBuilder: (context, index) {
            return ListBody(
              children: [Text('Hi')],
            );
          },
        ),
      ),
    );
  }

  void setsemestergpa() {}
}
