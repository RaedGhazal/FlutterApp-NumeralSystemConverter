import 'dart:math' as Math;

class Converter{
  String input;

  String decimalToBinary(double input) {
    String result = "";
    int x = (input).toInt();
    do {
      result += (x % 2).toString();
      x = x ~/ 2;
    } while (x > 0);
    result = String.fromCharCodes(result.runes.toList().reversed);
    if (input - (input.toInt()) != 0) {
      result += ".";
      double y = input - input.toInt();
      for (int i = 0; i < 4 && y != 0; i++) {
        y *= 2;
        result += (y.toInt().toString());
        if (y >= 1) y--;
        if (y == 0) break;
      }
    }
    return result;
  }

  String decimalToOctal(double input) {
    String result = "";
    int x = input.toInt();
    do {
      result += (x % 8).toString();
      x ~/= 8;
    } while (x > 0);
    result = String.fromCharCodes(result.runes.toList().reversed);
    if (input - (input.toInt()) != 0) {
      result += ".";
      double y = input - (input.toInt());
      for (int i = 0; i < 4 && y != 0; i++) {
        int reminder;
        y *= 8;
        reminder = y.toInt();
        result += (reminder.toString());
        y -= reminder;
        if (y == 0) break;
      }
    }
    return result;
  }

  String decimalToHexa(double input) {
    Map<int, String> m = new Map();
    m[10] = "A";
    m[11] = "B";
    m[12] = "C";
    m[13] = "D";
    m[14] = "E";
    m[15] = "F";
    String result = "";
    int x = input.toInt();
    do {
      int reminder = x % 16;
      if (reminder <= 9)
        result += reminder.toString();
      else
        result += m[reminder];
      x ~/= 16;
    } while (x > 0);
    result = String.fromCharCodes(result.runes.toList().reversed);
    if ((input - input.toInt()) != 0) {
      result += ".";
      double y = input - input.toInt();
      for (int i = 0; i < 4 && y != 0; i++) {
        int reminder;
        y *= 16;
        reminder = y.toInt();
        if (reminder <= 9)
          result += reminder.toString();
        else
          result += m[reminder];
        y -= reminder;
        if (y == 0) break;
      }
    }
    return result;
  }

  String binaryToDecimal(String input) {
    double result = 0;
    int l;
    bool dot = false;
    if (input.indexOf(".") != -1) {
      l = input.indexOf(".");
      dot = true;
    } else
      l = input.length;
    for (int j = 0, i = l - 1; i >= 0; i--, j++) {
      if (input[i] == '1') result += Math.pow(2, j);
    }
    if (dot) {
      for (int j = 1, i = l + 1; i < input.length; i++, j++) {
        if (input[i] == '1') result += 1.0 / Math.pow(2, j);
      }
    }
    return result.toString();
  }

  String octalToDecimal(String input) {
    double result = 0;
    int l;
    bool dot = false;
    if (input.indexOf(".") != -1) {
      l = input.indexOf(".");
      dot = true;
    } else
      l = input.length;
    for (int j = 0, i = l - 1; i >= 0; i--, j++) {
      result += int.parse(input[i]) * Math.pow(8, j);
    }
    if (dot) {
      for (int j = 1, i = l + 1; i < input.length; i++, j++) {
        result += int.parse(input[i]) / Math.pow(8, j);
      }
    }
    return result.toString();
  }

  String hexaToDecimal(String input) {
    Map<String, int> m = new Map();
    m["A"] = 10;
    m["B"] = 11;
    m["C"] = 12;
    m["D"] = 13;
    m["E"] = 14;
    m["F"] = 15;
    double result = 0;
    int l;
    bool dot = false;
    if (input.indexOf(".") != -1) {
      l = input.indexOf(".");
      dot = true;
    } else
      l = input.length;
    for (int j = 0, i = l - 1; i >= 0; i--, j++) {
      int x;
      if (m[input[i]] == null)
        x = int.parse(input[i]);
      else
        x = m[input[i]];
      print(m[input[i]]);
      result += x * Math.pow(16, j);
    }
    if (dot) {
      for (int j = 1, i = l + 1; i < input.length; i++, j++) {
        int x;
        if (m[input[i]] == null)
          x = int.parse(input[i]);
        else
          x = m[input[i]];
        result += x / Math.pow(16, j);
      }
    }
    return result.toString();
  }
}