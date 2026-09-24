import 'package:flutter/material.dart';

import '../models/emotion_state.dart';

/// Widget yang menampilkan suasana hati robot saat ini.
class MoodIndicator extends StatelessWidget {
  /// Keadaan emosi yang akan ditampilkan.
  final EmotionState state;

  /// Membuat widget penanda suasana hati.
  const MoodIndicator({super.key, required this.state});

  String _moodText() {
    switch (state.mood) {
      case Mood.happy:
        return 'Senang';
      case Mood.sad:
        return 'Sedih';
      case Mood.angry:
        return 'Marah';
      case Mood.sleepy:
        return 'Mengantuk';
      case Mood.neutral:
        return 'Netral';
    }
  }

  Color _moodColor() {
    switch (state.mood) {
      case Mood.happy:
        return Colors.yellow;
      case Mood.sad:
        return Colors.blueGrey;
      case Mood.angry:
        return Colors.red;
      case Mood.sleepy:
        return Colors.purple;
      case Mood.neutral:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: _moodColor().withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: _moodColor()),
      ),
      child: Text(
        'Mood: ${_moodText()} | Energy: ${state.energy.toStringAsFixed(0)}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
