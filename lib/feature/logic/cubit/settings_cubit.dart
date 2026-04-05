import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState {
  final ThemeMode themeMode;
  final double fontScale;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.fontScale = 1.0,
  });

  SettingsState copyWith({ThemeMode? themeMode, double? fontScale}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      fontScale: fontScale ?? this.fontScale,
    );
  }
}

class SettingsCubit extends Cubit<SettingsState> {
  static const _themeKey = 'app_theme_mode';
  static const _fontScaleKey = 'app_font_scale';

  SettingsCubit() : super(const SettingsState()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    // Load Theme
    final themeIndex = prefs.getInt(_themeKey);
    final themeMode = themeIndex != null
        ? ThemeMode.values[themeIndex]
        : ThemeMode.system;

    // Load Font Scale
    final fontScale = prefs.getDouble(_fontScaleKey) ?? 1.0;

    emit(state.copyWith(themeMode: themeMode, fontScale: fontScale));
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> updateFontScale(double scale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontScaleKey, scale);
    emit(state.copyWith(fontScale: scale));
  }
}
