part of 'add_note_cubit.dart';

sealed class AddNoteState extends Equatable {
  const AddNoteState();

  @override
  List<Object?> get props => [];
}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

final class AddNoteFailure extends AddNoteState {}

final class AddNoteImagePicked extends AddNoteState {
  final Uint8List? imageBytes;
  final bool isVisible;

  const AddNoteImagePicked({required this.imageBytes, required this.isVisible});

  @override
  List<Object?> get props => [imageBytes, isVisible];
}
