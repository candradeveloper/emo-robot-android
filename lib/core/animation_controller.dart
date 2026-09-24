import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

/// Pengontrol animasi kustom untuk transisi karakter robot.
class RobotAnimationController extends AnimationController {
  /// Membuat pengontrol animasi dengan [vsync] dan durasi default.
  RobotAnimationController({required TickerProvider vsync})
      : super(
          vsync: vsync,
          duration: const Duration(milliseconds: 500),
        );

  /// Memainkan transisi dari satu keadaan ke keadaan lainnya.
  Future<void> playTransition() async {
    forward();
    await Future<void>.delayed(duration ?? const Duration(milliseconds: 500));
    reverse();
  }
}
