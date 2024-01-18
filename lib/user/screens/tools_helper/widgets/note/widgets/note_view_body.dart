import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'note_list_view.dart';


class NoteViewBody extends StatefulWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          const CustomAppBar(title: "Note"),
          Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}
