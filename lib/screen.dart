import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _countdownTime = 30; // Initial countdown time in seconds
  bool _isRunning = false; // To track if the timer is running

  void _startTimer() {
    if (_isRunning) return; // Prevent multiple timers
    setState(() {
      _isRunning = true;
    });
    _countdownTime = 30; // Reset the timer to 10 seconds
    _runCountdown();
  }

  void _runCountdown() async {
    for (int i = _countdownTime; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _countdownTime--;
      });
    }
    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time Left: $_countdownTime',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startTimer,
              child: const Text("Start Timer"),
            ),
          ],
        ),
      ),
    );
  }
}
