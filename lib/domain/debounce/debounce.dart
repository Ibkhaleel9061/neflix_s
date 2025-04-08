import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});
// This function will be called after 500 milliseconds of inactivity
  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
// Only "Searching for: Flutter" will be printed after 500 ms of inactivity

// this code call the search page bloc 
               //  this varibale use final _debouncer = Debouncer(milliseconds: 1 * 1000);