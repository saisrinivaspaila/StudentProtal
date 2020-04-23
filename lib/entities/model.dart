import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class Student extends Model {
  String _regId = "";
  String _pass = "";
  Map<String, dynamic> responseData = {};
  String _name = '';
  String _mobileNumber = '';
  int _classesAttended, _classesConducted;
  double _attendance;
  bool _loginStatus = false;
  bool _isLoading = false;
  int _year, _section;
  Map<String, dynamic> _semData;
  Map _cgpa = {};
  Map _backlogInEachSem = {};
  Map _gradesInEachSem = {};
  bool get isLoading {
    return _isLoading;
  }

  String get name {
    return _name;
  }

  int get classesAttended {
    return _classesAttended;
  }

  int get classesConducted {
    return _classesConducted;
  }

  double get attendace {
    return _attendance;
  }

  String get mobileNumber {
    return _mobileNumber;
  }

  String get regId {
    return _regId;
  }

  String get pass {
    return _pass;
  }

  int get year {
    return _year;
  }

  int get section {
    return _section;
  }

  Map get backlogInfo {
    return _backlogInEachSem;
  }

  Map get cgpaInfo {
    return _cgpa;
  }

  Map get gradesInEachSem {
    return _gradesInEachSem;
  }

  bool get loginStatus {
    return _loginStatus;
  }

  Future<bool> fetchRegNo(String regId) {
    _regId = regId;
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://minipro2-9bc1f.firebaseio.com/regno/$_regId.json')
        .then<bool>((http.Response response) {
      _loginStatus = true;

      notifyListeners();
      responseData = json.decode(response.body);
      _pass = responseData["Password"];
      _name = responseData["Name"];
      _mobileNumber = responseData["Mobile Number"];
      _year = responseData["Year"];
      _section = responseData["Sec"];
      _semData = responseData["Semesters"];
      _semData.forEach((key, value) {
        _cgpa[key] = value["Semester GPA"];
        _backlogInEachSem[key] = value["Backlogs"];
        Map temp = {};
        value.forEach((key1, value1) {
          if (key1 != "Backlogs" && key1 != "Semester GPA") {
            temp[key1] = value1;
          }
        });
        _gradesInEachSem[key] = temp;
      });
      _classesAttended = responseData["Attendance"]["Classes attended"];
      _classesConducted = responseData["Attendance"]["Classes conducted"];
      _attendance = responseData["Attendance"]["Attendance Percentage"];
      _loginStatus = true;
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      print(error);
      _isLoading = false;
      _loginStatus = false;
      notifyListeners();
      return false;
    });
  }

  void onLogout() {
    _regId = "";
    _loginStatus = false;
  }

  void loginCheck(pass) {
    if (pass == _pass) {
      _loginStatus = true;
    } else {
      _loginStatus = false;
    }
  }

  Future<bool> setPass(passw) {
    _isLoading = true;
    notifyListeners();
    _pass = passw;

    return http
        .put(
            'https://minipro2-9bc1f.firebaseio.com/regno/$_regId/Password.json',
            body: json.encode(_pass))
        .then((http.Response response) {
      // print('i should be executed before am i waiting');
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      print('There is an error');
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }
}
