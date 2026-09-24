import 'package:flutter/material.dart';

import '../core/character_engine.dart';
import '../services/touch_service.dart';
import '../widgets/interaction_buttons.dart';
import '../widgets/robot_display.dart';
import 'character_selector.dart';

/// Halaman utama aplikasi Emo Robot.
class HomeScreen extends StatefulWidget {
  /// Engine karakter yang akan ditampilkan di halaman utama.
  final CharacterEngine engine;

  /// Membuat halaman utama aplikasi.
  const HomeScreen({super.key, required this.engine});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TouchService _touchService;

  @override
  void initState() {
    super.initState();
    _touchService = TouchService(engine: widget.engine);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.engine,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Emo Robot'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CharacterSelector(engine: widget.engine),
                    ),
                  );
                },
                tooltip: 'Pilih Karakter',
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: RobotDisplay(
                    engine: widget.engine,
                    touchService: _touchService,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: InteractionButtons(engine: widget.engine),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
