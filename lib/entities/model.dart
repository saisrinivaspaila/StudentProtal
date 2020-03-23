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
  bool _loginStatus;
  bool _isLoading = false;

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
    return double.parse(
        ((_classesAttended / _classesConducted) * 100).toStringAsFixed(2));
  }

  String get mobileNumber {
    return _mobileNumber;
  }

  String get regId {
    return _regId;
  }

  bool get loginStatus {
    return _loginStatus;
  }

  Future<bool> fetchRegNo(String regId) {
    print("hii");
    _regId = regId;
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://minipro2-9bc1f.firebaseio.com/regno/$_regId.json')
        .then<bool>((http.Response response) {
      responseData = json.decode(response.body);
      _pass = responseData["Password"];
      _name = responseData["Name"];
      _mobileNumber = responseData["Mobile Number"];
      print(_name);
      print(_mobileNumber);
      _classesAttended = responseData["Class attended"];
      _classesConducted = responseData["Classes conducted"];
      print(_classesConducted);
      print(_classesAttended);
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      print('There is an error');
      _isLoading = true;
      notifyListeners();
      return false;
    });
  }

  void onLogout() {
    _regId = "";
  }

  void loginCheck(pass) {
    if (pass == _pass) {
      _loginStatus = true;
    } else {
      _loginStatus = false;
    }
  }
}
