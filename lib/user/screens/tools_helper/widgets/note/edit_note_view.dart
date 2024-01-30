import 'package:expenses/user/models/note_model/note_model.dart';
import 'package:expenses/user/screens/tools_helper/widgets/note/widgets/edit_note_view_body.dart';
import 'package:flutter/material.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note),
    );
  }
}
