import 'package:hive_flutter/hive_flutter.dart';

import 'note_model.dart';

class NoteModelTypeAdapter extends TypeAdapter<NoteModel> {
  @override
  read(BinaryReader reader) {
    return NoteModel(
      title: reader.readString(),
      subTitle: reader.readString(),
      image: reader.read(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.subTitle);
    writer.write(obj.image);
  }
}
