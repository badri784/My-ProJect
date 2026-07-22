<p align="center">
  <img src="assets/image/app_icon.png" width="120" alt="Quran & Azkar Logo"/>
</p>

<h1 align="center">Quran & Azkar | القرآن والأذكار</h1>

<p align="center">
  <em>تطبيق إسلامي شامل — القرآن الكريم، الأذكار اليومية، مواقيت الصلاة، اتجاه القبلة، السبحة الإلكترونية والمزيد</em>
</p>

<p align="center">
  A comprehensive Islamic companion app built with Flutter — Quran reading, daily Azkar, prayer times, Qibla direction, Sebha counter, and more.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.11+-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/BLoC-Cubit_Pattern-blueviolet?style=for-the-badge" alt="BLoC"/>
  <img src="https://img.shields.io/badge/Platforms-Android_|_iOS-34a853?style=for-the-badge" alt="Platforms"/>
  <img src="https://img.shields.io/badge/Languages-العربية_|_English-f59e0b?style=for-the-badge" alt="Localization"/>
</p>

---

## ✨ Features

<table>
  <tr>
    <td width="50%">

### 📖 Quran Reader
- Browse and read all **114 Surahs** with full Arabic text
- Navigate by Surah name, number, or verse
- Beautiful Amiri Quran typography
- Powered by the [`quran`](https://pub.dev/packages/quran) package

</td>
<td width="50%">

### 🤲 Azkar (Remembrances)
- **Morning Azkar** — أذكار الصباح
- **Evening Azkar** — أذكار المساء
- **After Prayer Azkar** — أذكار بعد الصلاة
- **Sleep Azkar** — أذكار النوم
- Repetition counter with completion indicator ✅
- Hadith references & notes for each Zikr

</td>
  </tr>
  <tr>
    <td>

### 🕌 Prayer Times
- GPS-based automatic prayer time calculation
- All five daily prayers + Sunrise
- **Egyptian General Authority of Survey** method
- Next prayer countdown indicator
- Responsive layout for all screen sizes

</td>
<td>

### 🧭 Qibla Compass
- Real-time Qibla direction using device sensors
- Interactive compass UI
- Powered by [`flutter_qiblah`](https://pub.dev/packages/flutter_qiblah)

</td>
  </tr>
  <tr>
    <td>

### 📿 Sebha (Digital Tasbeeh)
- Tap-to-count with circular UI
- Preset Azkar selector (سبحان الله، الحمد لله، الله أكبر…)
- **Persistent count** via `SharedPreferences`
- Total count tracking across sessions
- Reset current or reset all

</td>
<td>

### ⚖️ Ahkam (Islamic Rulings)
- Browse Islamic rulings and Q&A
- Local JSON data source

</td>
  </tr>
</table>

### ⚙️ Additional Features
- 🎨 **Dark / Light Mode** — with persisted preference
- 🌐 **Bilingual** — Arabic 🇸🇦 & English 🇬🇧 with toggle
- 📱 **Onboarding** — 3-step introduction screens
- 📄 About, Privacy Policy, Terms & Conditions, Contact Us pages
- 🔄 **Responsive Design** — Adapts layout for phones & tablets

---

## 🏗️ Architecture

The project follows a **feature-based clean architecture** with clear separation between UI and business logic using the **Cubit pattern**:

```
lib/
├── main.dart                              # Entry point
├── quran.dart                             # Root widget (MaterialApp + SettingsCubit)
├── simble_bloc.dart                       # Custom BLoC observer
│
├── core/
│   ├── helpers/
│   │   ├── extension.dart                 # Dart extensions
│   │   └── padding.dart                   # verticalSpace / horizontalSpace helpers
│   ├── model/
│   │   ├── azkar_model.dart               # AllAzkar model (fromJson / toJson)
│   │   └── ahkam_model.dart               # Ahkam data model
│   ├── routing/
│   │   ├── routes.dart                    # Route name constants
│   │   └── app_router.dart                # onGenerateRoute (switch-case routing)
│   ├── service/
│   │   └── service.dart                   # Services layer
│   ├── theming/
│   │   ├── colors.dart                    # ColorsManger — full color palette
│   │   ├── font_weght.dart                # FontWeightManger — weight constants
│   │   └── text_styles.dart               # TextStyles — Google Fonts (Almarai, Amiri)
│   └── utils/
│       └── responsive_helper.dart         # Responsive breakpoint utilities
│
├── feature/
│   ├── home/
│   │   ├── logic/cubit/                   # Prayer time cubit
│   │   ├── ui/home_screen.dart            # Main home screen
│   │   └── ui/widgets/                    # AppBar, prayer times, grid views,
│   │       └── next_prayer_container/     #   next prayer countdown widget
│   │
│   ├── quran/
│   │   ├── logic/cubit/                   # QuranCubit, AllSurahsCubit
│   │   └── ui/
│   │       ├── quran_screen.dart          # Surah list browser
│   │       ├── surah_screen.dart          # Individual surah reader
│   │       └── widgets/                   # Quran-specific widgets
│   │
│   ├── azkar/
│   │   ├── logic/cubit/                   # Azkar state management
│   │   └── ui/
│   │       ├── azkar_screen.dart          # Azkar category selection
│   │       ├── moorning.dart              # أذكار الصباح
│   │       ├── evening.dart               # أذكار المساء
│   │       ├── post_pryar.dart            # أذكار بعد الصلاة
│   │       ├── sleeping.dart              # أذكار النوم
│   │       └── widgets/                   # Shared Azkar widgets
│   │
│   ├── sebha/
│   │   ├── logic/cubit/                   # Sebha counter cubit
│   │   └── ui/sebha_screen.dart           # Digital Tasbeeh screen
│   │
│   ├── qibla/
│   │   └── ui/qibla_screen.dart           # Qibla compass screen
│   │
│   ├── ahkam/
│   │   └── ui/ahkam_screen.dart           # Islamic rulings screen
│   │
│   ├── settings/
│   │   ├── logic/cubit/
│   │   │   └── settings_cubit.dart        # Theme, locale, font scale management
│   │   └── ui/                            # Settings screen
│   │
│   ├── on_boarding/
│   │   └── ui/                            # 3-step onboarding screens + widgets
│   │
│   ├── about_application/
│   │   ├── ui/                            # About, Privacy, Terms, Contact screens
│   │   └── widget/                        # Shared about widgets
│   │
│   └── shared/
│       └── widgets/
│           ├── bottom_navigation.dart     # Main bottom navigation bar
│           ├── card_widget.dart           # Reusable card component
│           ├── leading_icon_widget.dart   # Icon widget
│           ├── list_tile_widget.dart      # Custom list tile
│           └── snackbar_widget.dart       # Snackbar component
│
├── generated/                             # Auto-generated localization (intl)
└── l10n/
    ├── intl_ar.arb                        # Arabic translations
    └── intl_en.arb                        # English translations
```

### Assets

```
assets/
├── azkar/
│   ├── morning_azkar_data.json            # أذكار الصباح (14KB)
│   ├── evening_azkar.json                 # أذكار المساء
│   ├── post_pryar_azkar.json              # أذكار بعد الصلاة
│   └── sleeping_azkar.json                # أذكار النوم
├── ahkam/                                 # Islamic rulings data
├── image/
│   ├── app_icon.png                       # App icon
│   └── splash.png                         # Splash screen image
└── quran_pages/                           # Quran page assets
```

---

## 🛠️ Tech Stack

| Category | Package | Version | Purpose |
|----------|---------|---------|---------|
| **Framework** | Flutter | 3.x | Cross-platform mobile UI |
| **Language** | Dart | ^3.11.0 | Application language |
| **State Management** | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | ^9.1.1 | Cubit pattern for all state |
| **Prayer Times** | [`adhan`](https://pub.dev/packages/adhan) | ^2.0.0+1 | Accurate prayer time calculations |
| **Location** | [`geolocator`](https://pub.dev/packages/geolocator) | ^14.0.2 | GPS coordinates |
| **Qibla** | [`flutter_qiblah`](https://pub.dev/packages/flutter_qiblah) | ^3.2.0 | Qibla compass direction |
| **Quran Data** | [`quran`](https://pub.dev/packages/quran) | ^1.4.1 | Full Quran text & metadata |
| **Localization** | [`intl`](https://pub.dev/packages/intl) | ^0.20.2 | i18n (Arabic ↔ English) |
| **Fonts** | [`google_fonts`](https://pub.dev/packages/google_fonts) | ^8.0.2 | Almarai, Amiri, Amiri Quran |
| **Responsive UI** | [`flutter_screenutil_plus`](https://pub.dev/packages/flutter_screenutil_plus) | ^1.5.0 | Adaptive sizing (375×884) |
| **SVG** | [`flutter_svg`](https://pub.dev/packages/flutter_svg) | ^2.2.3 | SVG rendering |
| **Storage** | [`shared_preferences`](https://pub.dev/packages/shared_preferences) | ^2.5.5 | Persist settings & Sebha count |
| **URLs** | [`url_launcher`](https://pub.dev/packages/url_launcher) | ^6.3.2 | Open external links |
| **Icons** | [`font_awesome_flutter`](https://pub.dev/packages/font_awesome_flutter) | ^11.0.0 | Extended icon set |
| **Loading** | [`loading_animation_widget`](https://pub.dev/packages/loading_animation_widget) | ^1.3.0 | Loading animations |
| **App Icon** | [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) | ^0.14.4 | Platform app icons |
| **Splash** | [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash) | ^2.4.7 | Native splash screen |

---

## 🎨 Design System

### Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `backgroundDark` | `#121212` | Dark mode background |
| `backgroundWhite` | `#F7F5F1` | Light mode background |
| `greenDark` | `#0E4128` | Primary accent (dark) |
| `greenLight` | `#347C60` | Primary accent (light) |
| `darkGreen` | `#005A30` | Deep green |
| `lightGreen` | `#186942` | Secondary green |
| `yellow` | `#E0AF3B` | Warm accent |
| `yellowLight` | `#FFB300` | Amber highlight |
| `offWhite` | `#EBEDE5` | Subtle background |

### Typography

| Font | Usage |
|------|-------|
| **Almarai** | Arabic body text, UI labels |
| **Amiri** | Arabic headings, Azkar titles |
| **Amiri Quran** | Quranic verses |

All sizes use `flutter_screenutil_plus` with `.sp` units for responsive scaling.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Dart SDK ^3.11.0
- Android Studio / VS Code with Flutter & Dart extensions
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

# Android App Bundle (Google Play)
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## 🌐 Localization

The app fully supports **Arabic** (default) and **English**. Localization is powered by the `intl` package with `.arb` files:

| File | Language | Size |
|------|----------|------|
| `lib/l10n/intl_ar.arb` | Arabic 🇸🇦 | ~6.7 KB |
| `lib/l10n/intl_en.arb` | English 🇬🇧 | ~5.4 KB |

Users can toggle languages from **Settings** at any time. The preference is persisted via `SharedPreferences`.

**To add a new language:**
1. Create a new `.arb` file (e.g., `intl_fr.arb`) in `lib/l10n/`
2. Run: `flutter pub run intl_utils:generate`
3. Add the locale to `supportedLocales` in `quran.dart`

---

## 🎨 Theming

The app supports **Dark Mode** (default) and **Light Mode** with a carefully crafted color palette:

| Mode | Background | Accent | Typography |
|------|-----------|--------|------------|
| 🌙 **Dark** | Deep dark `#121212` | Green `#0E4128` + Amber `#FFB300` | White text |
| ☀️ **Light** | Off-white `#F7F5F1` | Green `#347C60` + Yellow `#E0AF3B` | Dark text |

Theme preference is managed by `SettingsCubit` and persisted across sessions.

---

## 📱 Permissions

| Permission | Purpose |
|-----------|---------|
| 📍 **Location** | Calculate accurate prayer times & Qibla direction based on GPS |
| 🌐 **Internet** | Load Google Fonts & external resources |

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
