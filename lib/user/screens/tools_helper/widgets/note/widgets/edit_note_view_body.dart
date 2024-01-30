import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/user/models/note_model/note_model.dart';
import 'package:expenses/user/screens/tools_helper/widgets/note/notes_cubit/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'custom_app_bar.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note,}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  void initState() {
    // TODO: implement initState

    title = widget.note.title;
    content = widget.note.subTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomAppBar(title: tr(context, "editNote"),),
          const SizedBox(height: 50,),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title),
          const SizedBox(height: 16),
          CustomTextField(
            // controller: contentController,
              onChanged: (value) {
                content = value;
              },
              hintText: widget.note.subTitle, maxLine: 5),
          const SizedBox(height: 32),
           CustomButton(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
