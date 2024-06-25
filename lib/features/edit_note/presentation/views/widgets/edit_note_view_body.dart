import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/functions/toast_dialog.dart';
import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../../../../core/shared/widgets/custom_text_input.dart';
import '../../../../home/data/model/note_model.dart';
import '../../../../home/presentation/view_model/cubit/get_notes_cubit.dart';
import '../../view_model/cubit/edit_note_cubit.dart';
import 'custom_edit_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    context.read<EditNoteCubit>().title.text = note.title;
    context.read<EditNoteCubit>().subTitle.text = note.subTitle;
    return BlocListener<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccess) {
          Future.delayed(
            const Duration(milliseconds: 300),
            () => showToast(text: 'Edit Successifully'),
          );
          context.read<GetNotesCubit>().getNotes();
          context.pop();
        } else {
          debugPrint('can not Edit on Notes');
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: SafeArea(
            child: Column(
              children: [
                const VerticalSpace(10),
                CustomEditAppBar(
                  onTap: () {
                    NoteModel newNote = NoteModel(
                      title: context.read<EditNoteCubit>().title.text,
                      subTitle: context.read<EditNoteCubit>().subTitle.text,
                      image: null,
                    );
                    context.read<EditNoteCubit>().editNote(
                          index: index,
                          note: newNote,
                        );
                    Future.delayed(
                      const Duration(milliseconds: 300),
                      () => showToast(text: 'Edit Successifuly'),
                    );
                    context.read<GetNotesCubit>().getNotes();
                    context.pop();
                  },
                ),
                const VerticalSpace(20),
                Visibility(
                  visible: note.image != null,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: note.image != null
                          ? DecorationImage(
                              image: MemoryImage(
                                note.image!,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                const VerticalSpace(20),
                CustomTextInput(
                  onChanged: (val) {
                    context.read<EditNoteCubit>().title.text = val;
                  },
                  onSaved: (val) {
                    context.read<EditNoteCubit>().title.text = val!;
                  },
                  controller: context.read<EditNoteCubit>().title,
                  // initialValue: note.title,
                  hint: 'Title',
                ),
                const VerticalSpace(30),
                CustomTextInput(
                  onChanged: (val) {
                    context.read<EditNoteCubit>().subTitle.text = val;
                  },
                  onSaved: (val) {
                    context.read<EditNoteCubit>().subTitle.text = val!;
                  },
                  controller: context.read<EditNoteCubit>().subTitle,
                  // initialValue: note.subTitle,
                  hint: 'Type something...',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
