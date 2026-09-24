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

/// Widget utama aplikasi yang mengatur tema, splash, dan state global.
class EmoRobotApp extends StatefulWidget {
  /// Membuat aplikasi utama.
  const EmoRobotApp({super.key});

  @override
  State<EmoRobotApp> createState() => _EmoRobotAppState();
}

class _EmoRobotAppState extends State<EmoRobotApp> {
  late final CharacterEngine _engine;
  bool _isReady = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _engine = CharacterEngine();
    _initializeApp();
  }

  /// Memuat preferensi karakter tersimpan dan menyiapkan aplikasi.
  Future<void> _initializeApp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('selected_character_index');
      if (savedIndex != null && savedIndex >= 0) {
        _engine.switchCharacter(savedIndex);
      }
    } catch (e) {
      debugPrint('Gagal memuat preferensi karakter: $e');
      _errorMessage = 'Gagal memuat preferensi karakter.';
    }

    if (mounted) {
      setState(() => _isReady = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    }

    if (_errorMessage != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FallbackScreen(message: _errorMessage!),
      );
    }

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

/// Layar splash yang ditampilkan saat aplikasi sedang diinisialisasi.
class SplashScreen extends StatelessWidget {
  /// Membuat layar splash.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.smart_toy,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'Emo Robot',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
            'Memuat...',
            style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

/// Layar fallback yang ditampilkan ketika terjadi kesalahan kritis.
class FallbackScreen extends StatelessWidget {
  /// Pesan kesalahan yang akan ditampilkan.
  final String message;

  /// Membuat layar fallback dengan pesan kesalahan.
  const FallbackScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              Text(
                'Terjadi Kesalahan',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => runApp(const EmoRobotApp()),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
