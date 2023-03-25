import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/shared/component/custom_text_field.dart';
import 'package:note_app_hive/shared/cubit/cubit.dart';

class EditNoteScreen extends StatelessWidget {
   EditNoteScreen({Key? key, this.title, this.content, required this.noteModel}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final NoteModel noteModel;
   String? title;
   String ?content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Note",
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 13.sp),
              onPressed:() {
                noteModel.content = content??noteModel.content;
                noteModel.title = title??noteModel.title;
                noteModel.save();
                BlocProvider.of<AppCubit>(context).getNotes();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.check,
                size: 35.sp,
              )
          )
        ],
      ),
      body: ListView(
        padding:const EdgeInsets.all(15),
        children: [
          SizedBox(height: 50.h,),
          customStatelessTextField(
            onChanged: (value) {
              title =value;
            },
              hintText: noteModel.title,maxLines: 2,controller: titleController),
          SizedBox(height: 30.h,),
          customStatelessTextField(
              onChanged: (value) {
                content =value;
              },
              hintText: noteModel.content,maxLines: 5,controller: noteController),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}
