/// Enum yang merepresentasikan berbagai suasana hati robot.
enum Mood {
  /// Robot merasa sangat senang.
  happy,

  /// Robot dalam keadaan netral.
  neutral,

  /// Robot merasa sedih.
  sad,

  /// Robot merasa marah atau frustrasi.
  angry,

  /// Robot merasa lelah atau mengantuk.
  sleepy,
}

/// Model yang menyimpan keadaan emosi robot saat ini.
class EmotionState {
  /// Suasana hati saat ini.
  final Mood mood;

  /// Tingkat energi robot, berkisar dari 0 hingga 100.
  final double energy;

  /// Membuat instance baru dari keadaan emosi.
  const EmotionState({
    required this.mood,
    required this.energy,
  });

  /// Keadaan emosi default ketika aplikasi baru dimulai.
  factory EmotionState.initial() {
    return const EmotionState(mood: Mood.neutral, energy: 80.0);
  }

  /// Membuat salinan dari keadaan emosi dengan nilai yang dapat diubah.
  EmotionState copyWith({Mood? mood, double? energy}) {
    return EmotionState(
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
    );
  }
}
