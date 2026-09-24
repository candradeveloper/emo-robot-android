import 'package:flutter/material.dart';

import 'base_character.dart';

/// Karakter Robot Bulat dengan perilaku energik dan kemampuan berputar.
class RobotBulat extends BaseCharacter {
  @override
  List<Color> getColors() {
    return [Colors.pink, Colors.purple, Colors.deepPurple];
  }

  @override
  String getIdleAnimation() {
    return 'assets/animations/robot_bulat_idle.json';
  }

  @override
  List<String> getGreetings() {
    return [
      'Halo! Aku Robot Bulat!',
      'Senang bertemu denganmu!',
      'Ayo bermain bersama!',
    ];
  }

  @override
  VoidCallback getSpecialAction() {
    return () {
      debugPrint('Robot Bulat berputar dengan cepat!');
    };
  }
}
