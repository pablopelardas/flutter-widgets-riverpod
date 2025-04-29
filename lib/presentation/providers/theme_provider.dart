import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// AppTheme (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  setColor(int color) {
    state = state.copyWith(selectedColor: color);
  }
}
