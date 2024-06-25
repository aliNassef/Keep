import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/widgets/custom_icon.dart';
import '../../../../../core/shared/widgets/custom_sized_box.dart';
import '../../view_model/add_note_cubit/add_note_cubit.dart';

class CustomTakeNoteAppBar extends StatelessWidget {
  const CustomTakeNoteAppBar({
    super.key,
    this.onTap,
    this.pickImage,
  });
  final void Function()? onTap;
  final void Function()? pickImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<AddNoteCubit>().title.clear();
            context.read<AddNoteCubit>().subTitle.clear();
            context.read<AddNoteCubit>().imageBytes = null;
            context.read<AddNoteCubit>().isVisible = false;
            context.pop();
          },
          child: const CustomIcon(
            icon: Icons.arrow_back_ios_new_sharp,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: pickImage,
          child: const CustomIcon(
            icon: Icons.photo_library_rounded,
          ),
        ),
        const HorizantilSpace(20),
        InkWell(
          onTap: onTap,
          child: const CustomIcon(
            icon: Icons.save,
          ),
        )
      ],
    );
  }
}
