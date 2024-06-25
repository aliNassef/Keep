import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../constants.dart';
import '../../../../home/data/model/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  editNote({required int index, required NoteModel note}) async {
    try {
      // new data after that i wanna sae it
      await Hive.box<NoteModel>(AppConstants.kBoxName).putAt(
        index,
        note,
      );
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure());
    }
  }
}
