import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../add_note_cubit/add_note_cubit.dart';
import '../notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            //todo if true the user cant do anything on the screen
            absorbing: state is AddNoteLoading ? true : false,
            child:  Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: const SingleChildScrollView(
                  child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}