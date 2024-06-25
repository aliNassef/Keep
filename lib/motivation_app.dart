import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_router.dart';
import 'core/utils/themes/app_theme.dart';
import 'core/utils/themes/app_theme_cubit/app_themes_cubit.dart';
import 'core/utils/themes/app_theme_cubit/app_themes_state.dart';
import 'core/utils/themes/theme_state.dart';
import 'features/home/presentation/view_model/cubit/get_notes_cubit.dart';
import 'features/take_note/presentation/view_model/add_note_cubit/add_note_cubit.dart';

class MotivationApp extends StatelessWidget {
  const MotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AppThemesCubit()..changeTheme(ThemeState.intial),
          ),
          BlocProvider(
            create: (context) => GetNotesCubit(),
          ),
          BlocProvider(
            create: (context) => AddNoteCubit(),
          ),
        ],
        child: BlocBuilder<AppThemesCubit, AppThemesState>(
          builder: (context, state) {
            if (state is AppThemesDark) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: AppTheme.darkTheme,
              );
            } else {
               return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: AppTheme.lightTheme,
              );
            }
          },
        ),
      ),
    );
  }
}
