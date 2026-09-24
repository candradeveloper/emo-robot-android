import 'package:flutter/material.dart';

import '../models/character_model.dart';

/// Kelas abstrak dasar untuk setiap karakter robot.
/// Setiap karakter harus mengimplementasikan properti dan metode berikut.
abstract class BaseCharacter {
  /// Mendapatkan daftar warna karakter.
  List<Color> getColors();

  /// Mendapatkan nama animasi idle karakter.
  String getIdleAnimation();

  /// Mendapatkan daftar ucapan salam karakter.
  List<String> getGreetings();

  /// Mendapatkan aksi spesial karakter sebagai callback.
  VoidCallback getSpecialAction();

  /// Mengonversi karakter ke model yang dapat dikonsumsi UI.
  CharacterModel toModel() {
    return CharacterModel(
      name: runtimeType.toString(),
      description: 'Karakter robot unik dengan kemampuan spesial.',
      colors: getColors(),
      idleAnimation: getIdleAnimation(),
      greetings: getGreetings(),
      specialAction: getSpecialAction(),
    );
  }
}
