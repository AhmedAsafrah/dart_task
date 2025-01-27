import 'dart:io';

int? getInput() {
  try {
    int input = int.parse(stdin.readLineSync()!);
    if (input < 1 || input > 9) throw FormatException();
    return input;
  } catch (_) {
    return null;
  }
}
