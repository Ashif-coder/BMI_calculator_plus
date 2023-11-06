import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorNotifier extends ChangeNotifier{

  double _bmi =0;
  String _bmiResult ="";
  String _bmiResultLinks ="";
  String _bmiResultDes ="";

  String get getBmi => _bmi.toStringAsFixed(1);
  String get getBmiResult => _bmiResult;
  String get getBmiResultDes => _bmiResultDes;
  String get getBmiResultLinks => _bmiResultLinks;


  void calculateBMI({required int height,required int weight}) {
    _bmi = weight / pow(height / 100, 2);
    notifyListeners();
  }

  void getResult() {
    if (_bmi >= 25) {
      _bmiResult = 'Overweight';
    } else if (_bmi > 18.5) {
      _bmiResult = 'Normal';
    } else {
      _bmiResult = 'Underweight';
    }
    notifyListeners();
  }

  void getInterpretation() {
    if (_bmi >= 25) {
      _bmiResultDes = 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      _bmiResultDes = 'You have a normal body weight. Good job!';
    } else {
      _bmiResultDes = 'You have a lower than normal body weight. You can eat a bit more.';
    }
    notifyListeners();
  }

  void getLinks() {
    if (_bmi >= 25) {
      _bmiResultLinks = 'https://www.everydayhealth.com/diet-nutrition/bmi/how-you-reduce-your-bmi-science-backed-steps/';
    } else if (_bmi >= 18.5) {
      _bmiResultLinks = 'https://www.drmalladi.com/tips-maintaining-healthy-bmi/';
    } else {
      _bmiResultLinks = 'https://www.healthdirect.gov.au/what-to-do-if-you-are-underweight';
    }
    notifyListeners();
  }
}
