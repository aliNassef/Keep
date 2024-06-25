import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/functions/attention_delete_message.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/themes/app_theme_cubit/app_themes_cubit.dart';
import '../../../../../core/utils/themes/theme_state.dart';
import '../../../data/model/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.index,
  });
  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    context.watch<AppThemesCubit>().getCurrentTheme();
    final themeState = context.watch<AppThemesCubit>().currentTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.editNoteView,
          extra: {"note": note, "index": index},
        );
      },
      onLongPress: () {
        attentionDeleteMessage(context, index);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: themeState == ThemeState.light ? Colors.grey : Colors.white,
          ),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(
          note.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
