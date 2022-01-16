import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});
  int? weight;
  int? height;
  double? _bmi = 1;
  //NOTEEEE... USED 1 BECAUSE OF THE NULLABLE STUFF.. WITHOUT IT APP WILL CRUSH.
  String? calculateBmi() {
    _bmi = weight! / pow(height! / 100, 2);

    return _bmi?.toStringAsFixed(1);
  }

  String? getResults() {
    if (25 <= (_bmi!)) {
      return 'OVER WEIGHT';
    } else {
      if ((_bmi!) >= 18) {
        return 'NORMAL';
      } else {
        return 'UNDER WEIGHT';
      }
    }
  }

  String? getInterpritation() {
    if ((_bmi!) >= 25) {
      return 'You have a higher that normal weight. Try to exercise more';
    } else if ((_bmi!) >= 18) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
