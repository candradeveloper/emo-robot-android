import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/character_engine.dart';
import 'screens/home_screen.dart';

/// Titik masuk utama aplikasi Emo Robot.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EmoRobotApp());
}

/// Widget utama aplikasi yang mengatur tema dan state global.
class EmoRobotApp extends StatelessWidget {
  /// Membuat aplikasi utama.
  const EmoRobotApp({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = CharacterEngine();
    _loadSavedCharacter(engine);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterEngine>.value(value: engine),
      ],
      child: MaterialApp(
        title: 'Emo Robot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(engine: engine),
      ),
    );
  }

  /// Memuat preferensi karakter tersimpan dari SharedPreferences.
  Future<void> _loadSavedCharacter(CharacterEngine engine) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('selected_character_index');
      if (savedIndex != null) {
        engine.switchCharacter(savedIndex);
      }
    } catch (e) {
      // Jika terjadi kesalahan, tetap jalankan aplikasi dengan karakter default.
      debugPrint('Gagal memuat preferensi karakter: $e');
    }
  }
}
