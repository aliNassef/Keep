import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constants.dart';
import '../../../features/home/data/model/note_model.dart';
import '../../../features/home/presentation/view_model/cubit/get_notes_cubit.dart';
import '../../utils/app_styles.dart';
import '../../utils/themes/app_theme_cubit/app_themes_cubit.dart';
import '../../utils/themes/theme_state.dart';
import '../widgets/custom_sized_box.dart';

Future<dynamic> attentionDeleteMessage(BuildContext context, int index) {
  return showDialog(
    context: context,
    builder: (context) {
      final themeState = context.watch<AppThemesCubit>().currentTheme;
      return AlertDialog(
        backgroundColor:
            themeState == ThemeState.light ? Colors.white : Colors.black12,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info,
              color: themeState == ThemeState.light
                  ? Colors.black
                  : const Color(0xff606060),
            ),
            const VerticalSpace(18),
            const Text('do you want to delete this note ?'),
          ],
        ),
        actions: [
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.red,
              ),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              'cancel',
              style: AppStyles.textStyle18R.copyWith(color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color(0xff30BE71),
              ),
            ),
            onPressed: () {
              Hive.box<NoteModel>(AppConstants.kBoxName).deleteAt(index);
              context.read<GetNotesCubit>().getNotes();
              context.pop();
            },
            child: Text(
              'ok',
              style: AppStyles.textStyle18R.copyWith(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
