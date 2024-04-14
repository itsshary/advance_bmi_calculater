import 'package:flutter/material.dart';

class Appproviderclass with ChangeNotifier {
  int _selectedGender = 0;
  int _height = 0;
  int _age = 1;
  int _weight = 1;
  double bmiResult = 0;
  late String _healthStatus;

  int get selectedGender => _selectedGender;
  int get height => _height;
  int get weight => _weight;
  int get age => _age;
  String get healthStatus => _healthStatus;

  void heightFun(int heightval) {
    _height = heightval;
    notifyListeners();
  }

  void setString(String val) {
    _healthStatus = val;
    notifyListeners();
  }

  void selectedGenderFun(int value) {
    _selectedGender = value;
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  void dicrementAge() {
    _age--;
    notifyListeners();
  }

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void dicrementWeight() {
    _weight--;
    notifyListeners();
  }

  void calculateBmi() {
    double divededcm = _height / 100;

    double bmical = _weight / (divededcm * divededcm);

    bmiResult = bmical;
    notifyListeners();
  }
}
