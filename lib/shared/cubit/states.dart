import 'package:note_app_hive/models/note_model.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppLoadingState extends AppStates{}
class AddNote extends AppStates{}
class DeleteNote extends AppStates{}
class AddNoteSuccess extends AppStates{}
class GetNoteSuccess extends AppStates{
  final List< dynamic> noteModel ;
  GetNoteSuccess(this.noteModel);
}
class AddNoteFailure extends AppStates{
  final String errorMessage ;

  AddNoteFailure(this.errorMessage);

}
class GetNoteFailure extends AppStates{
  final String errorMessage ;

  GetNoteFailure(this.errorMessage);

}