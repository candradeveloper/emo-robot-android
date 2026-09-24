import 'package:flutter/material.dart';

import '../core/character_engine.dart';
import '../services/touch_service.dart';
import 'mood_indicator.dart';

/// Widget yang menampilkan robot dan menangani interaksi pengguna.
class RobotDisplay extends StatelessWidget {
  /// Engine karakter yang menyediakan data robot dan emosi.
  final CharacterEngine engine;

  /// Layanan sentuhan untuk menangani interaksi pengguna.
  final TouchService touchService;

  /// Membuat widget tampilan robot.
  const RobotDisplay({
    super.key,
    required this.engine,
    required this.touchService,
  });

  @override
  Widget build(BuildContext context) {
    final character = engine.getCurrentCharacter();
    final model = character.toModel();
    final colors = model.colors;

    return GestureDetector(
      onTap: touchService.onTap,
      onDoubleTap: touchService.onDoubleTap,
      onLongPress: touchService.onLongPress,
      onPanEnd: touchService.onSwipe,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.smart_toy,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              model.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            MoodIndicator(state: engine.currentEmotion),
          ],
        ),
      ),
    );
  }
}
