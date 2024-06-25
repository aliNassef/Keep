import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cache/cache_helper.dart';
import '../../../service_locator.dart';
import '../theme_state.dart';
import 'app_themes_state.dart';

class AppThemesCubit extends Cubit<AppThemesState> {
  AppThemesCubit() : super(AppThemesInitial());
  ThemeState currentTheme = ThemeState.intial;

  getCurrentTheme() {
    if (getIt.get<CacheHelper>().getData(key: 'theme') != null) {
      if (getIt.get<CacheHelper>().getData(key: 'theme') == 'light') {
        currentTheme = ThemeState.light;
      } else {
        currentTheme = ThemeState.dark;
      }
    }
  }

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.intial:
        if (getIt.get<CacheHelper>().getData(key: 'theme') != null) {
          if (getIt.get<CacheHelper>().getData(key: 'theme') == 'light') {
            emit(AppThemesLight());
          } else {
            emit(AppThemesDark());
          }
        }
        break;
      case ThemeState.dark:
        getIt.get<CacheHelper>().saveData(key: 'theme', value: 'dark');
        emit(AppThemesDark());
        break;
      case ThemeState.light:
        getIt.get<CacheHelper>().saveData(key: 'theme', value: 'light');
        emit(AppThemesLight());
        break;
    }
  }
}
