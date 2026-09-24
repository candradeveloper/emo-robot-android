# Emo Robot

Aplikasi Android robot peliharaan virtual dengan beberapa karakter unik, sistem emosi, dan pipeline CI/CD otomatis melalui GitHub Actions.

## Fitur Utama

- Tiga karakter robot unik: Robot Bulat, Robot Kotak, dan Robot Alien.
- Sistem emosi dinamis: senang, sedih, marah, mengantuk, dan netral.
- Interaksi sentuhan: ketuk, ketuk ganda, tekan lama, dan geser.
- Desain responsif untuk berbagai ukuran layar Android.
- Pipeline CI/CD otomatis untuk membangun APK debug, release, dan split APK.

## Teknologi

- Flutter SDK `>=3.0.0 <4.0.0`
- Provider untuk state management
- Lottie untuk animasi
- Audioplayers untuk efek suara
- Shared Preferences untuk menyimpan preferensi karakter

## Instalasi APK

1. Buka halaman **Releases** di repositori GitHub ini.
2. Unduh file APK yang sesuai, misalnya `app-release.apk`.
3. Transfer APK ke perangkat Android.
4. Aktifkan **Install from unknown sources** di pengaturan perangkat.
5. Buka file APK dan ikuti proses instalasi.

## Pengembangan Lokal

```bash
# Clone repositori
git clone https://github.com/username/emo-robot-android.git
cd emo-robot-android

# Instal dependensi
flutter pub get

# Jalankan aplikasi
flutter run

# Jalankan pengujian
flutter test

# Build APK release
flutter build apk --release
```

## Struktur Proyek

```
lib/
├── main.dart
├── core/
│   ├── animation_controller.dart
│   ├── character_engine.dart
│   └── emotion_system.dart
├── models/
│   ├── character_model.dart
│   └── emotion_state.dart
├── characters/
│   ├── base_character.dart
│   ├── robot_bulat.dart
│   ├── robot_kotak.dart
│   └── robot_alien.dart
├── screens/
│   ├── home_screen.dart
│   └── character_selector.dart
├── widgets/
│   ├── robot_display.dart
│   ├── mood_indicator.dart
│   └── interaction_buttons.dart
└── services/
    ├── touch_service.dart
    └── audio_service.dart
```

## Kontribusi

1. Fork repositori ini.
2. Buat branch fitur: `git checkout -b fitur-baru`.
3. Commit perubahan: `git commit -m "Menambahkan fitur baru"`.
4. Push ke branch: `git push origin fitur-baru`.
5. Buat Pull Request ke branch `main` atau `develop`.

## Screenshot

> Bagian ini dapat diisi dengan tangkapan layar aplikasi setelah build.

## Lisensi

Proyek ini dirilis di bawah lisensi MIT.
