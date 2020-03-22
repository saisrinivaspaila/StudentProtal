import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class Student extends Model {
  String _regId = "17L31A0501";
  Map<String, dynamic> responseData = {};
  String _name = '';
  String _mobileNumber = '';
  int _classesAttended, _classesConducted;

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  String get name {
    return _name;
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

  Future<bool> fetchRegNo() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://minipro2-9bc1f.firebaseio.com/regno.json')
        .then<bool>((http.Response response) {
      responseData = json.decode(response.body);
      _name = responseData[_regId]["Name"];
      _mobileNumber = responseData[_regId]["Mobile Number"];
      // print(_name);
      // print(_mobileNumber);

      _classesAttended = responseData[_regId]["Class attended"];

      _classesConducted = responseData[_regId]["Classes conducted"];
      print(_classesConducted);
      print(_classesAttended);

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
