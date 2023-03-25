import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit getObject(context)=>BlocProvider.of(context);
  int current = 0;
  late List<dynamic> notes ;
  Color color = const Color(0xff97D8B2);
  void addNote(NoteModel noteModel)async{
    emit(AppLoadingState());
    noteModel.color = color.value;
    Box noteBox = Hive.box<NoteModel>("notes_box");
    await noteBox.add(noteModel).then((value){
      print("Success");
      emit(AddNoteSuccess());
    }).catchError((error){
      print("Error");
      emit(AddNoteFailure(error.toString()));
    });
  }
  void getNotes()async{
      Box noteBox = Hive.box<NoteModel>("notes_box");
      notes = noteBox.values.toList();
      emit(GetNoteSuccess());
  }

  void changeColor(int index){
    current = index;
    emit(ChangeColorSuccess());
  }

}