import 'package:flutter/material.dart';

import '../models/emotion_state.dart';

/// Sistem yang mengelola perubahan emosi robot berdasarkan interaksi.
class EmotionSystem extends ChangeNotifier {
  EmotionState _currentState = EmotionState.initial();

  /// Mendapatkan keadaan emosi saat ini.
  EmotionState get currentState => _currentState;

  /// Mengubah suasana hati robot menjadi bahagia.
  void makeHappy() {
    _currentState = _currentState.copyWith(
      mood: Mood.happy,
      energy: (_currentState.energy + 10.0).clamp(0.0, 100.0),
    );
    notifyListeners();
  }

  /// Mengubah suasana hati robot menjadi sedih.
  void makeSad() {
    _currentState = _currentState.copyWith(
      mood: Mood.sad,
      energy: (_currentState.energy - 5.0).clamp(0.0, 100.0),
    );
    notifyListeners();
  }

  /// Mengubah suasana hati robot menjadi marah.
  void makeAngry() {
    _currentState = _currentState.copyWith(mood: Mood.angry);
    notifyListeners();
  }

  /// Mengubah suasana hati robot menjadi lelah.
  void makeSleepy() {
    _currentState = _currentState.copyWith(
      mood: Mood.sleepy,
      energy: (_currentState.energy - 10.0).clamp(0.0, 100.0),
    );
    notifyListeners();
  }

  /// Mengembalikan suasana hati ke netral.
  void calmDown() {
    _currentState = _currentState.copyWith(mood: Mood.neutral);
    notifyListeners();
  }
}
