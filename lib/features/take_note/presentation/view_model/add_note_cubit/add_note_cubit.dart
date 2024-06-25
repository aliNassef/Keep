import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../constants.dart';
import '../../../../home/data/model/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  Uint8List? imageBytes;
  bool isVisible = false;
  addNote({required NoteModel note}) async {
    try {
      emit(AddNoteInitial());
      await Hive.box<NoteModel>(AppConstants.kBoxName).add(
        note,
      );
      emit(AddNoteSuccess());
      title.clear();
      subTitle.clear();
      isVisible = false;
    } catch (e) {
      debugPrint(e.toString());
      emit(AddNoteFailure());
    }
  }

  void setImage(Uint8List? imageBytes) {
    this.imageBytes = imageBytes;
    isVisible = imageBytes != null;
    emit(AddNoteImagePicked(imageBytes: this.imageBytes, isVisible: isVisible));
  }
}
