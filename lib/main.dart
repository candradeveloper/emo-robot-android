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
class EmoRobotApp extends StatefulWidget {
  /// Membuat aplikasi utama.
  const EmoRobotApp({super.key});

  @override
  State<EmoRobotApp> createState() => _EmoRobotAppState();
}

class _EmoRobotAppState extends State<EmoRobotApp> {
  final CharacterEngine _engine = CharacterEngine();

  @override
  void initState() {
    super.initState();
    _loadSavedCharacter();
  }

  /// Memuat preferensi karakter tersimpan secara asinkron di latar belakang.
  /// Jika gagal, aplikasi tetap berjalan dengan karakter default.
  Future<void> _loadSavedCharacter() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('selected_character_index');
      if (savedIndex != null && savedIndex >= 0) {
        _engine.switchCharacter(savedIndex);
      }
    } catch (e) {
      debugPrint('Gagal memuat preferensi karakter: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterEngine>.value(value: _engine),
      ],
      child: MaterialApp(
        title: 'Emo Robot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(engine: _engine),
      ),
    );
  }
}
