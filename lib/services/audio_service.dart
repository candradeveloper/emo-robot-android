import 'package:audioplayers/audioplayers.dart';

/// Layanan untuk memainkan efek suara aplikasi.
class AudioService {
  final AudioPlayer _player = AudioPlayer();

  /// Memainkan efek suara dari [assetPath] jika tersedia.
  /// Jika terjadi kesalahan, akan ditangkap tanpa merusak aplikasi.
  Future<void> playEffect(String assetPath) async {
    try {
      await _player.play(AssetSource(assetPath));
    } catch (e) {
      _log('Gagal memainkan audio: $e');
    }
  }

  /// Membersihkan resource audio yang digunakan.
  Future<void> dispose() async {
    try {
      await _player.dispose();
    } catch (e) {
        _log('Gagal membuang resource audio: $e');
    }
  }
}

/// Fungsi pembantu untuk mencetak pesan debug lintas layanan.
void _log(String message) {
  // ignore: avoid_print
  print(message);
}
