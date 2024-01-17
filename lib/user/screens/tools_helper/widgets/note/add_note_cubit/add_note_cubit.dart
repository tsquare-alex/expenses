import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/user/models/note_model/note_model.dart';
import 'package:expenses/user/screens/tools_helper/widgets/note/notes_cubit/notes_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';


part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  NotesCubit notesCubit = NotesCubit();
  addNote(NoteModel note)async{
    emit(AddNoteLoading());
  try{
    var notesBox = Hive.box<NoteModel>(noteKey);
    await notesBox.add(note);
    notesCubit.fetchAllNotes();
    emit(AddNoteSuccess());

  }catch(e){
    emit(AddNoteFailure(errorMessage: e.toString()));
  }
  }

}
