import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/modules/edit_note/edit_screen.dart';
import 'package:note_app_hive/shared/component/notes_colors.dart';
import 'package:note_app_hive/shared/cubit/cubit.dart';

Widget customNoteItem({required int index ,required BuildContext context,required NoteModel noteModel}){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(top: 30.sp,bottom: 30.sp,left: 20.sp,),
    margin: EdgeInsets.only(bottom: 16.sp),
    decoration: BoxDecoration(
      color: BlocProvider.of<AppCubit>(context).color,
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder:(context) => EditNoteScreen(noteModel: noteModel,),)
            );
          },
          title:Text(
            noteModel.title,
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
          subtitle: Padding(
            padding:  EdgeInsets.only(top: 20.sp,bottom:20.sp ),
            child: Text(
              noteModel.content,
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black.withOpacity(.7)
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              noteModel.delete();
              BlocProvider.of<AppCubit>(context).getNotes();
            },
            icon: Icon(
              Icons.delete,
              size: 35.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.sp,),
          child: Text(
            noteModel.date,
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black.withOpacity(.7)
            ),
          ),
        ),
      ],
    ),
  );
}