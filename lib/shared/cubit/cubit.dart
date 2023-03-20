import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit getObject(context)=>BlocProvider.of(context);

  addNote(NoteModel noteModel)async{
    emit(AppLoadingState());
    Box noteBox = Hive.box<NoteModel>("notes_box");
    await noteBox.add(noteModel).then((value){
      print("Success");
      emit(AddNoteSuccess());
    }).catchError((error){
      print("Error");
      emit(AddNoteFailure(error.toString()));
    });
  }
}