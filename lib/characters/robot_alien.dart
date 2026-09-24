import 'package:flutter/material.dart';

import 'base_character.dart';

/// Karakter Robot Alien dengan tarian aneh dan kemampuan teleportasi.
class RobotAlien extends BaseCharacter {
  @override
  List<Color> getColors() {
    return [Colors.green, Colors.orange, Colors.amber];
  }

  @override
  String getIdleAnimation() {
    return 'assets/animations/robot_alien_idle.json';
  }

  @override
  List<String> getGreetings() {
    return [
      'Bip bop! Aku datang dari planet lain!',
      'Siapa yang mau berteleportasi?',
      'Tarian ini sangat aneh, ya?',
    ];
  }

  @override
  VoidCallback getSpecialAction() {
    return () {
      debugPrint('Robot Alien melakukan teleportasi!');
    };
  }
}
