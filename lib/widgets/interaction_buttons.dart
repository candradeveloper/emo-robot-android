import 'package:flutter/material.dart';

import '../core/character_engine.dart';

/// Widget yang menampilkan tombol interaksi untuk mengubah suasana hati.
class InteractionButtons extends StatelessWidget {
  /// Engine karakter yang akan dipengaruhi oleh tombol interaksi.
  final CharacterEngine engine;

  /// Membuat widget tombol interaksi.
  const InteractionButtons({super.key, required this.engine});

  @override
  Widget build(BuildContext context) {
    final emotionSystem = engine.emotionSystem;
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _buildButton(
          label: 'Senang',
          icon: Icons.sentiment_very_satisfied,
          color: Colors.orange,
          onPressed: emotionSystem.makeHappy,
        ),
        _buildButton(
          label: 'Sedih',
          icon: Icons.sentiment_dissatisfied,
          color: Colors.blue,
          onPressed: emotionSystem.makeSad,
        ),
        _buildButton(
          label: 'Marah',
          icon: Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          onPressed: emotionSystem.makeAngry,
        ),
        _buildButton(
          label: 'Mengantuk',
          icon: Icons.nightlight_round,
          color: Colors.purple,
          onPressed: emotionSystem.makeSleepy,
        ),
        _buildButton(
          label: 'Tenang',
          icon: Icons.self_improvement,
          color: Colors.teal,
          onPressed: emotionSystem.calmDown,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
