import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─── Settings State ──────────────────────────────────────────────────────────

class SettingsState {
  final ThemeMode themeMode;
  final double fontScale;
  final Locale locale;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.fontScale = 1.0,
    this.locale = const Locale('ar'),
  });

  /// Returns `true` when the current locale is Arabic.
  bool get isArabic => locale.languageCode == 'ar';

  SettingsState copyWith({
    ThemeMode? themeMode,
    double? fontScale,
    Locale? locale,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      fontScale: fontScale ?? this.fontScale,
      locale: locale ?? this.locale,
    );
  }
}

// ─── Settings Cubit ──────────────────────────────────────────────────────────

class SettingsCubit extends Cubit<SettingsState> {
  static const _themeKey = 'app_theme_mode';
  static const _fontScaleKey = 'app_font_scale';
  static const _localeKey = 'app_locale';

  SettingsCubit() : super(const SettingsState()) {
    _loadSettings();
  }

  // ── Load persisted settings from SharedPreferences ──────────────────────

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Load Theme
    final themeIndex = prefs.getInt(_themeKey);
    final themeMode = themeIndex != null
        ? ThemeMode.values[themeIndex]
        : ThemeMode.system;

    // Load Font Scale
    final fontScale = prefs.getDouble(_fontScaleKey) ?? 1.0;

    // Load Locale (default to Arabic)
    final localeCode = prefs.getString(_localeKey) ?? 'ar';
    final locale = Locale(localeCode);

    emit(state.copyWith(
      themeMode: themeMode,
      fontScale: fontScale,
      locale: locale,
    ));
  }

  // ── Theme ───────────────────────────────────────────────────────────────

  Future<void> updateThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
    emit(state.copyWith(themeMode: mode));
  }

  // ── Font Scale ──────────────────────────────────────────────────────────

  Future<void> updateFontScale(double scale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontScaleKey, scale);
    emit(state.copyWith(fontScale: scale));
  }

  // ── Locale ──────────────────────────────────────────────────────────────

  /// Toggle between Arabic ↔ English.
  Future<void> toggleLocale() async {
    final newLocale =
        state.isArabic ? const Locale('en') : const Locale('ar');
    await _persistLocale(newLocale);
    emit(state.copyWith(locale: newLocale));
  }

  /// Set an explicit locale.
  Future<void> setLocale(Locale locale) async {
    await _persistLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  Future<void> _persistLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
