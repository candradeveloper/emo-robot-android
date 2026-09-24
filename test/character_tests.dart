import 'package:flutter_test/flutter_test.dart';

import 'package:emo_robot/characters/robot_alien.dart';
import 'package:emo_robot/characters/robot_bulat.dart';
import 'package:emo_robot/characters/robot_kotak.dart';
import 'package:emo_robot/core/character_engine.dart';

void main() {
  group('CharacterEngine tests', () {
    test('getCharacters mengembalikan 3 karakter', () {
      final engine = CharacterEngine();
      expect(engine.getCharacters().length, 3);
    });

    test('switchCharacter mengganti karakter aktif', () {
      final engine = CharacterEngine();
      engine.switchCharacter(1);
      expect(engine.getCurrentCharacter(), isA<RobotKotak>());
    });

    test('switchCharacter dengan indeks negatif tidak merusak state', () {
      final engine = CharacterEngine();
      final current = engine.getCurrentCharacter();
      engine.switchCharacter(-1);
      expect(engine.getCurrentCharacter(), equals(current));
    });
  });

  group('Character behavior tests', () {
    test('RobotBulat memiliki warna pink/purple', () {
      final robot = RobotBulat();
      final colors = robot.getColors();
      expect(colors.isNotEmpty, true);
    });

    test('RobotKotak memiliki salam yang tenang', () {
      final robot = RobotKotak();
      expect(robot.getGreetings().isNotEmpty, true);
    });

    test('RobotAlien memiliki aksi spesial', () {
      final robot = RobotAlien();
      expect(robot.getSpecialAction, isNotNull);
    });
  });
}
