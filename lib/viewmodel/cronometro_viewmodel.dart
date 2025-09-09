import 'dart:async';
import 'package:flutter/foundation.dart';
import '../model/cronometro_model.dart';

class CronometroViewmodel extends ChangeNotifier {
  CronometroModel _model = CronometroModel(
    elapsed: Duration.zero,
    isRunning: false,
    voltas: [],
    gvolta: [],
  );
  CronometroModel get model => _model;

  Timer? _timer;

  final Stopwatch _stopwatch = Stopwatch();

  double _bottomProgress = 0.0;
  double _topProgress = 0.0;

  double get bottomProgress => _bottomProgress;
  double get topProgress => _topProgress;

  bool isRunning() {
    return _stopwatch.isRunning;
  }

  void start() {
    if (_model.isRunning) return;

    _stopwatch.start();
    _model = _model.copyWith(isRunning: true);
    notifyListeners();

    _timer = Timer.periodic(Duration(milliseconds: 16), (_) {
      _model = _model.copyWith(elapsed: _stopwatch.elapsed);
      _updateProgressBars();
      notifyListeners();
    });
  }

  void stop() {
    if (!_model.isRunning) return;

    _stopwatch.stop();
    _timer?.cancel();
    _model = model.copyWith(isRunning: false, elapsed: _stopwatch.elapsed);
    notifyListeners();
  }

  void reset() {
    _stopwatch.reset();
    _stopwatch.stop();
    _timer?.cancel();

    _model = CronometroModel(
      elapsed: Duration.zero,
      isRunning: false,
      voltas: [],
      gvolta: [],
    );
    _bottomProgress = 0.0;
    _topProgress = 0.0;
    notifyListeners();
  }

  void volta() {
    final currentElapsed = _stopwatch.elapsed;
    if (_stopwatch.isRunning) {
      if (_model.gvolta.isEmpty) {
        _model.gvolta.add(currentElapsed);
        _model.voltas.add(currentElapsed);
      } else {
        final lastLapTime = _model.gvolta.last;
        final lapDuration = currentElapsed - lastLapTime;

        _model.gvolta.add(currentElapsed);
        _model.voltas.add(lapDuration);
      }
    }

    notifyListeners();
  }

  void _updateProgressBars() {
    final elapsedMillis = _stopwatch.elapsedMilliseconds;

    final currentMinute = _stopwatch.elapsed.inMinutes;

    if (currentMinute % 2 == 0) {
      _bottomProgress = (elapsedMillis % 60000) / 60000.0;
    } else {
      _bottomProgress = 1.0;
    }

    if (currentMinute % 2 == 0) {
      _topProgress = 0.0;
    } else {
      _topProgress = (elapsedMillis % 60000) / 60000.0;
    }
    notifyListeners();
  }
}
