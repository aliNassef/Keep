import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/themes/app_theme_cubit/app_themes_cubit.dart';
import '../../../../../core/utils/themes/theme_state.dart';
import '../../view_model/cubit/get_notes_cubit.dart';
import 'note_item.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  void initState() {
    super.initState();
    context.read<GetNotesCubit>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        return state is GetNotesSuccess
            ? state.notes.isEmpty
                ? Column(
                    children: [
                      VerticalSpace(MediaQuery.sizeOf(context).height * .20),
                      Image.asset(
                        AppImages.home,
                        height: MediaQuery.sizeOf(context).height * .4,
                      ),
                      const VerticalSpace(5),
                      Text(
                        'Create your first note !',
                        style: AppStyles.textStyle20L.copyWith(
                          color: context.watch<AppThemesCubit>().currentTheme ==
                                  ThemeState.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      )
                    ],
                  )
                : MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 15.h,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        index: index,
                        note: state.notes[index],
                      );
                    },
                  )
            : const Text('data');
      },
    );
  }
}
