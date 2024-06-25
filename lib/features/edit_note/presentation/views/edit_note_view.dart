import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/edit_note_cubit.dart';

import '../../../home/data/model/note_model.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EditNoteCubit(),
        child: EditNoteViewBody(
          index: index,
          note: note,
        ),
      ),
    );
  }
}
