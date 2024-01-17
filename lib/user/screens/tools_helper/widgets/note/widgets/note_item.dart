import 'package:expenses/user/screens/tools_helper/widgets/note/notes_cubit/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../general/constants/MyColors.dart';
import '../../../../../models/note_model/note_model.dart';
import '../edit_note_view.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.noteModel,}) : super(key: key);
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  EditNoteView(note: noteModel,)));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 24,bottom: 24),
        decoration: BoxDecoration(
          color: MyColors.primary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(noteModel.title,style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
              )),
              subtitle:  Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(noteModel.subTitle,style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                  fontSize: 20,
                )),
              ),
              trailing: IconButton(onPressed: (){
                noteModel.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              }, icon: const Icon(FontAwesomeIcons.trash,  color: Colors.black,)),
      
      
            ),
             Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(noteModel.date,style: const TextStyle(
                color: Colors.black,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
