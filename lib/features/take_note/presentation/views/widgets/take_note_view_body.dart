import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/functions/pick_image.dart';
import '../../../../../core/shared/functions/toast_dialog.dart';
import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../../../../core/shared/widgets/custom_text_input.dart';
import '../../../../home/data/model/note_model.dart';
import '../../../../home/presentation/view_model/cubit/get_notes_cubit.dart';
import '../../view_model/add_note_cubit/add_note_cubit.dart';
import 'custom_take_note_app_bar.dart';

class TakeNoteViewBody extends StatelessWidget {
  const TakeNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Future.delayed(
            const Duration(milliseconds: 300),
            () => showToast(text: 'added successifully'),
          );
          context.read<GetNotesCubit>().getNotes();
          context.pop();
        } else {
          debugPrint('Can not Add On Note');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
            child: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const VerticalSpace(10),
                    CustomTakeNoteAppBar(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          debugPrint(context.read<AddNoteCubit>().title.text);
                          context.read<AddNoteCubit>().addNote(
                                note: NoteModel(
                                  title:
                                      context.read<AddNoteCubit>().title.text,
                                  subTitle: context
                                      .read<AddNoteCubit>()
                                      .subTitle
                                      .text,
                                  image:
                                      context.read<AddNoteCubit>().imageBytes,
                                ),
                              );
                        }
                      },
                      pickImage: () async {
                        context
                            .read<AddNoteCubit>()
                            .setImage(await pickImage());
                      },
                    ),
                    const VerticalSpace(20),
                    Visibility(
                      visible: context.read<AddNoteCubit>().isVisible,
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: context.watch<AddNoteCubit>().imageBytes !=
                                  null
                              ? DecorationImage(
                                  image: MemoryImage(
                                    context.read<AddNoteCubit>().imageBytes!,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    const VerticalSpace(20),
                    CustomTextInput(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        // Additional validation logic here.
                        return null;
                      },
                      onSaved: (val) {
                        context.read<AddNoteCubit>().title.text = val!;
                      },
                      controller: context.read<AddNoteCubit>().title,
                      hint: 'Title',
                    ),
                    const VerticalSpace(30),
                    CustomTextInput(
                      onSaved: (val) {
                        context.read<AddNoteCubit>().subTitle.text = val!;
                      },
                      controller: context.read<AddNoteCubit>().subTitle,
                      hint: 'Type something...',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
