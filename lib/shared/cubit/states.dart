import 'package:note_app_hive/models/note_model.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppLoadingState extends AppStates{}
class AddNote extends AppStates{}
class DeleteNote extends AppStates{}
class AddNoteSuccess extends AppStates{}
class ChangeColorSuccess extends AppStates{}
class GetNoteSuccess extends AppStates{

}
class AddNoteFailure extends AppStates{
  final String errorMessage ;

  AddNoteFailure(this.errorMessage);

}
