import 'dart:async';
import 'package:flutter/material.dart';

class TimerGame extends StatefulWidget {
  @override
  _TimerGameState createState() => _TimerGameState();
}

class _TimerGameState extends State<TimerGame> {
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;

    return '${_padZero(hours)}:${_padZero(minutes)}:${_padZero(secs)}';
  }

  String _padZero(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_elapsedSeconds),
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}
