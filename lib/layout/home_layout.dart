import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/shared/component/custom_note_item.dart';

class HomeNotesLayOut extends StatelessWidget {
  const HomeNotesLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35.sp,
        ),
      ),
      body:ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return customNoteItem();
        },
      )
    );
  }
}
