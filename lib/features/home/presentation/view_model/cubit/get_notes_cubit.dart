import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../constants.dart';
import '../../../data/model/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  List<NoteModel> notes = [];
  getNotes() async {
    try {
//      emit(GetNotesInitial());
      notes = Hive.box<NoteModel>(AppConstants.kBoxName).values.toList();
      AppConstants.notes = notes;
      emit(GetNotesSuccess(
        notes: notes,
      ));
    } catch (e) {
      debugPrint(e.toString());
      emit(GetNotesFailure());
    }
  }
}
