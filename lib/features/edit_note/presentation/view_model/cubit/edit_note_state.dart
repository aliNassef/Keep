part of 'edit_note_cubit.dart';

sealed class EditNoteState extends Equatable {
  const EditNoteState();

  @override
  List<Object> get props => [];
}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteSuccess extends EditNoteState {}

final class EditNoteFailure extends EditNoteState {}
