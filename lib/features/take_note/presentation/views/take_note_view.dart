import 'package:flutter/material.dart';

import 'widgets/take_note_view_body.dart';

class TakeNoteView extends StatelessWidget {
  const TakeNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TakeNoteViewBody(),
    );
  }
}
