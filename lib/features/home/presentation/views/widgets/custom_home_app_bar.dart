import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/themes/app_theme_cubit/app_themes_cubit.dart';
import '../../../../../core/utils/themes/theme_state.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(context.read<AppThemesCubit>().currentTheme.toString());
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Text(
            'Notes',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.searchView);
            },
            child: const CustomIcon(
              icon: Icons.search,
            ),
          ),
          const HorizantilSpace(21),
          //mode_night_outlined
          //bedtime
          InkWell(
            onTap: () {
              context.read<AppThemesCubit>().changeTheme(
                    context.read<AppThemesCubit>().currentTheme ==
                            ThemeState.dark
                        ? ThemeState.light
                        : ThemeState.dark,
                  );
              context.read<AppThemesCubit>().currentTheme == ThemeState.dark
                  ? context.read<AppThemesCubit>().currentTheme =
                      ThemeState.light
                  : context.read<AppThemesCubit>().currentTheme =
                      ThemeState.dark;
            },
            child: const CustomIcon(
              icon: Icons.brightness_2,
            ),
          ),
        ],
      ),
    );
  }
}
