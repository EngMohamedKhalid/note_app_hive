import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/shared/component/custom_button.dart';
import 'package:note_app_hive/shared/component/custom_color_item.dart';
import 'package:note_app_hive/shared/component/custom_note_item.dart';
import 'package:note_app_hive/shared/component/custom_text_field.dart';
import 'package:note_app_hive/shared/component/notes_colors.dart';
import 'package:note_app_hive/shared/cubit/cubit.dart';
import 'package:note_app_hive/shared/cubit/states.dart';

class HomeNotesLayOut extends StatefulWidget {
  const HomeNotesLayOut({Key? key}) : super(key: key);

  @override
  State<HomeNotesLayOut> createState() => _HomeNotesLayOutState();
}

class _HomeNotesLayOutState extends State<HomeNotesLayOut> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    if(state is AddNoteSuccess){
      Navigator.pop(context);
      noteController.clear();
      titleController.clear();
    }
  },
  builder: (context, state) {
    var cubit = AppCubit.getObject(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Notes",
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
                Icons.search,
                size: 35.sp,
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)
              ),
                context: context,
                builder:(context) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 16.w ,
                        right: 16.w,
                        bottom:MediaQuery.of(context).viewInsets.bottom,
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        autovalidateMode: autoValidateMode,
                        child: Column(
                          children: [
                            SizedBox(height: 50.h,),
                            customStatelessTextField(hintText: "Title",maxLines: 2,controller: titleController),
                            SizedBox(height: 30.h,),
                            customStatelessTextField(hintText: "Note",maxLines: 5,controller: noteController),
                            SizedBox(height: 30.h,),
                            SizedBox(
                              height: 90.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: colors.length,
                                  itemBuilder: (context, index) {
                                    return CustomColorItem(index: index);
                                  },
                              ),
                            ),
                            SizedBox(height: 30.h,),
                            CustomButton(
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    NoteModel noteModel = NoteModel(
                                        title: titleController.text,
                                        content: noteController.text,
                                        date:DateFormatter.formatDateTime(
                                            dateTime: DateTime.now(),
                                            outputFormat: "dd/MM/yyyy",
                                        ),
                                        color: cubit.color.value,
                                    );
                                   cubit.addNote(noteModel);
                                   cubit.getNotes();
                                  }else{

                                  }
                                },
                                text: "Add Note"
                            ),
                            SizedBox(height: 30.h,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            );
          },
        child: Icon(
          Icons.add,
          size: 35.sp,

        ),
      ),
      body:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.sp ,vertical: 16.sp),
        physics: const BouncingScrollPhysics(),
        itemCount: cubit.notes.length,
        itemBuilder: (context, index) {
          return customNoteItem(
            context: context,
            index: index,
            noteModel: cubit.notes[index],
          );
        },
      )
    );
  },
);
  }
}
