abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppLoadingState extends AppStates{}
class AddNote extends AppStates{}
class DeleteNote extends AppStates{}
class AddNoteSuccess extends AppStates{}
class AddNoteFailure extends AppStates{
  final String errorMessage ;

  AddNoteFailure(this.errorMessage);

}