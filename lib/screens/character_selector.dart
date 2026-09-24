import 'package:flutter/material.dart';

import '../core/character_engine.dart';
import '../models/character_model.dart';

/// Halaman untuk memilih karakter robot.
class CharacterSelector extends StatelessWidget {
  /// Engine karakter yang digunakan untuk mengganti karakter.
  final CharacterEngine engine;

  /// Membuat halaman pemilih karakter.
  const CharacterSelector({super.key, required this.engine});

  @override
  Widget build(BuildContext context) {
    final characters = engine.getCharacters();

    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Karakter')),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: character.colors.first,
                child: const Icon(Icons.smart_toy, color: Colors.white),
              ),
              title: Text(character.name),
              subtitle: Text(character.description),
              onTap: () {
                engine.switchCharacter(index);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
