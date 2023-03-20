import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/shared/component/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
   EditNoteScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
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
              onPressed:() {},
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
          customStatelessTextField(hintText: "Title",maxLines: 2,controller: titleController),
          SizedBox(height: 30.h,),
          customStatelessTextField(hintText: "Note",maxLines: 5,controller: noteController),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}
