import 'package:flutter/material.dart';

/// Model dasar yang merepresentasikan karakter robot.
class CharacterModel {
  /// Nama karakter yang akan ditampilkan.
  final String name;

  /// Deskripsi singkat tentang karakter.
  final String description;

  /// Palet warna karakter.
  final List<Color> colors;

  /// Animasi idle dalam format Lottie atau deskripsi animasi.
  final String idleAnimation;

  /// Daftar ucapan salam yang dapat diucapkan karakter.
  final List<String> greetings;

  /// Fungsi yang dipicu ketika aksi spesial karakter dijalankan.
  final VoidCallback specialAction;

  /// Membuat model karakter baru.
  const CharacterModel({
    required this.name,
    required this.description,
    required this.colors,
    required this.idleAnimation,
    required this.greetings,
    required this.specialAction,
  });
}
