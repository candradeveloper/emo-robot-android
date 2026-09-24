import 'package:flutter/material.dart';

import 'base_character.dart';

/// Karakter Robot Kotak dengan perilaku tenang dan kemampuan meditasi.
class RobotKotak extends BaseCharacter {
  @override
  List<Color> getColors() {
    return [Colors.blue, Colors.green, Colors.teal];
  }

  @override
  String getIdleAnimation() {
    return 'assets/animations/robot_kotak_idle.json';
  }

  @override
  List<String> getGreetings() {
    return [
      'Halo, aku Robot Kotak.',
      'Mari bersantai sejenak.',
      'Ketenangan adalah kekuatanku.',
    ];
  }

  @override
  VoidCallback getSpecialAction() {
    return () {
      debugPrint('Robot Kotak sedang bermeditasi dengan tenang.');
    };
  }
}
