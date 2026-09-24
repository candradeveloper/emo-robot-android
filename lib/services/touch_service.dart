import 'package:flutter/material.dart';

import '../core/character_engine.dart';

/// Layanan untuk menangani interaksi sentuhan pengguna terhadap robot.
class TouchService {
  /// Engine karakter yang digunakan oleh layanan sentuhan.
  final CharacterEngine engine;

  /// Membuat instance layanan sentuhan dengan engine yang diberikan.
  TouchService({required this.engine});

  /// Menangani sentuhan singkat pada robot.
  void onTap() {
    engine.emotionSystem.makeHappy();
  }

  /// Menangani sentuhan ganda pada robot.
  void onDoubleTap() {
    final character = engine.getCurrentCharacter();
    if (character.runtimeType.toString() == 'RobotBulat') {
      character.getSpecialAction()();
      engine.enqueueAnimation('spin');
    }
  }

  /// Menangani tekan lama pada robot.
  void onLongPress() {
    final character = engine.getCurrentCharacter();
    if (character.runtimeType.toString() == 'RobotKotak') {
      character.getSpecialAction()();
      engine.enqueueAnimation('meditation');
    }
  }

  /// Menangani gerakan menggeser pada robot.
  void onSwipe(DragEndDetails details) {
    final character = engine.getCurrentCharacter();
    if (character.runtimeType.toString() == 'RobotAlien') {
      character.getSpecialAction()();
      engine.enqueueAnimation('teleport');
    }
  }
}
