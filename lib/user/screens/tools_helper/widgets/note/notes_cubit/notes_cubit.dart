import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../../../../general/constants/constants.dart';
import '../../../../../models/note_model/note_model.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes(){
    try{
      var notesBox = Hive.box<NoteModel>(noteKey);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
    }catch(e){
      emit(NotesFailure(errorMessage: e.toString()));
    }
  }
}
