import 'package:flutter/material.dart';

import '../characters/base_character.dart';
import '../characters/robot_alien.dart';
import '../characters/robot_bulat.dart';
import '../characters/robot_kotak.dart';
import '../models/character_model.dart';
import '../models/emotion_state.dart';
import 'emotion_system.dart';

/// Singleton mesin karakter yang mengelola daftar karakter,
/// perpindahan karakter, suasana hati, dan antrean animasi.
class CharacterEngine extends ChangeNotifier {
  static final CharacterEngine _instance = CharacterEngine._internal();

  /// Mengembalikan instance tunggal dari CharacterEngine.
  factory CharacterEngine() => _instance;

  CharacterEngine._internal()
      : _emotionSystem = EmotionSystem(),
        _characters = [
          RobotBulat(),
          RobotKotak(),
          RobotAlien(),
        ] {
    _currentIndex = 0;
    _animationQueue = <String>[];
    _emotionSystem.addListener(_onEmotionChanged);
  }

  void _onEmotionChanged() {
    notifyListeners();
  }

  final EmotionSystem _emotionSystem;

  /// Sistem emosi yang digunakan oleh mesin karakter.
  EmotionSystem get emotionSystem => _emotionSystem;

  final List<BaseCharacter> _characters;
  late int _currentIndex;
  late List<String> _animationQueue;

  /// Mendapatkan daftar semua karakter dalam bentuk model.
  List<CharacterModel> getCharacters() {
    return _characters.map((c) => c.toModel()).toList();
  }

  /// Mendapatkan karakter yang sedang aktif.
  BaseCharacter getCurrentCharacter() => _characters[_currentIndex];

  /// Mengganti karakter aktif berdasarkan indeks yang diberikan.
  /// Jika indeks tidak valid, maka tidak terjadi perubahan.
  void switchCharacter(int index) {
    if (index < 0 || index >= _characters.length) {
      return;
    }
    _currentIndex = index;
    notifyListeners();
  }

  /// Mendapatkan keadaan emosi saat ini.
  EmotionState get currentEmotion => _emotionSystem.currentState;

  /// Menambahkan animasi ke dalam antrean.
  void enqueueAnimation(String animationName) {
    _animationQueue.add(animationName);
  }

  /// Mengambil dan menghapus animasi pertama dari antrean.
  String? dequeueAnimation() {
    if (_animationQueue.isEmpty) {
      return null;
    }
    return _animationQueue.removeAt(0);
  }

  /// Membersihkan semua animasi dalam antrean.
  void clearAnimationQueue() {
    _animationQueue.clear();
  }
}
