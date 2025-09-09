class CronometroModel {
  final Duration elapsed;
  final bool isRunning;
  final List<Duration> voltas;
  final List<Duration> gvolta;

  CronometroModel({
    required this.elapsed,
    required this.isRunning,
    required this.voltas,
    required this.gvolta,
  });

  CronometroModel copyWith({
    Duration? elapsed,
    bool? isRunning,
    List<Duration>? voltas,
  }) {
    return CronometroModel(
      elapsed: elapsed ?? this.elapsed,
      isRunning: isRunning ?? this.isRunning,
      voltas: voltas ?? this.voltas,
      gvolta: gvolta ?? this.gvolta,
    );
  }
}
