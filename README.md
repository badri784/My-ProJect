<p align="center">
  <img src="assets/image/app_icon.png" width="120" alt="Quran & Azkar Logo"/>
</p>

<h1 align="center">Quran & Azkar | القرآن والأذكار</h1>

<p align="center">
  A comprehensive Islamic companion app built with Flutter — Quran reading, daily Azkar, prayer times, Qibla direction, Sebha counter, and more.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart" alt="Dart"/>
  <img src="https://img.shields.io/badge/State_Management-BLoC-blueviolet" alt="BLoC"/>
  <img src="https://img.shields.io/badge/Platforms-Android_|_iOS-green" alt="Platforms"/>
  <img src="https://img.shields.io/badge/Localization-Arabic_|_English-orange" alt="Localization"/>
</p>

---

## ✨ Features

### 📖 Quran Reader
- Browse and read all **114 Surahs** with full Arabic text
- Navigate by Surah name, number, or verse
- Powered by the [`quran`](https://pub.dev/packages/quran) package for accurate Quran data

### 🤲 Azkar (Remembrances)
- **Morning Azkar** — Start your day with remembrance of Allah
- **Evening Azkar** — End your day with remembrance
- **After Prayer Azkar** — Post-Salah remembrances
- **Sleep Azkar** — Bedtime supplications
- Each Zikr includes repetition counter, reference, and notes
- Visual indicator when repetitions are completed ✅

### 🕌 Prayer Times
- Automatic prayer time calculation based on **GPS location**
- Supports all five daily prayers + Sunrise
- Uses the **Egyptian General Authority of Survey** calculation method
- Displays next prayer with a countdown indicator
- Dark & light mode support

### 🧭 Qibla Compass
- Real-time Qibla direction using device sensors
- Interactive compass UI powered by [`flutter_qiblah`](https://pub.dev/packages/flutter_qiblah)

### 📿 Sebha (Digital Tasbeeh)
- Tap-to-count digital counter with a beautiful circular UI
- Dropdown selector for common Azkar (SubhanAllah, Alhamdulillah, Allahu Akbar, etc.)
- **Persistent count** — saved to local storage via `SharedPreferences`
- Total count tracking across sessions
- Reset current count or reset all

### ⚖️ Ahkam (Islamic Rulings)
- Browse Islamic rulings and Q&A

### ⚙️ Settings
- **Dark / Light mode** support
- **Language switching** — Arabic 🇸🇦 & English 🇬🇧
- About, Privacy Policy, Terms & Conditions, Contact Us pages

---

## 🏗️ Architecture

The project follows a **clean, feature-based architecture** with clear separation of concerns:

```
lib/
├── core/                    # Shared utilities & configuration
│   ├── helpers/             # Extensions, padding helpers
│   ├── model/               # Data models (Zekr, etc.)
│   ├── routing/             # App router & route definitions
│   ├── service/             # Services layer
│   └── theming/             # Colors, text styles, font weights
│
├── feature/
│   ├── logic/               # Business logic (Cubits)
│   │   └── cubit/           # PrayerTimeCubit, SettingsCubit
│   ├── ui/
│   │   └── screens/
│   │       ├── home/        # Home screen + widgets
│   │       ├── quran/       # Quran reader (screen, cubit, widgets)
│   │       ├── azkar/       # Azkar screens (morning, evening, etc.)
│   │       ├── sebha/       # Sebha counter (screen, cubit, widgets)
│   │       ├── qibla/       # Qibla compass
│   │       ├── ahkam/       # Islamic rulings
│   │       ├── settings/    # App settings
│   │       └── about_application/
│   └── widget/              # Shared/reusable widgets
│
├── generated/               # Auto-generated localization files
├── l10n/                    # Localization source (intl_ar.arb, intl_en.arb)
└── quran.dart               # App root widget (MaterialApp)
```

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.x |
| **Language** | Dart 3.x |
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit pattern) |
| **Prayer Times** | [adhan](https://pub.dev/packages/adhan) |
| **Location** | [geolocator](https://pub.dev/packages/geolocator) |
| **Qibla** | [flutter_qiblah](https://pub.dev/packages/flutter_qiblah) |
| **Quran Data** | [quran](https://pub.dev/packages/quran) |
| **Localization** | [intl](https://pub.dev/packages/intl) + flutter_localizations |
| **Fonts** | [google_fonts](https://pub.dev/packages/google_fonts) |
| **Responsive UI** | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) |
| **Local Storage** | [shared_preferences](https://pub.dev/packages/shared_preferences) |
| **Icons** | Material Icons + [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Android Studio / VS Code with Flutter extension
- A physical device or emulator

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/quran-azkar.git
cd quran-azkar

# Install dependencies
flutter pub get

# Generate localization files
flutter pub run intl_utils:generate

# Run the app
flutter run
```

### Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## 🌐 Localization

The app supports **Arabic** and **English**. Localization files are located in `lib/l10n/`:

| File | Language |
|------|---------|
| `intl_ar.arb` | Arabic 🇸🇦 |
| `intl_en.arb` | English 🇬🇧 |

To add a new language, create a new `.arb` file and run:
```bash
flutter pub run intl_utils:generate
```

---

## 🎨 Theming

The app supports **Dark Mode** and **Light Mode** with a carefully crafted color palette:

- **Dark Mode**: Deep dark backgrounds with subtle white overlays and amber accents
- **Light Mode**: Clean off-white backgrounds with green accent colors
- Typography powered by **Google Fonts** (Cairo, Amiri Quran)

---

## 📱 Permissions

The app requires the following permissions:

| Permission | Purpose |
|-----------|---------|
| **Location** | Calculate accurate prayer times & Qibla direction |
| **Internet** | Load Google Fonts |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">
  Built with ❤️ and Flutter
  <br/>
  <em>بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ</em>
</p>
