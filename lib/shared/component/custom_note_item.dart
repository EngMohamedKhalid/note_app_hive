import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customNoteItem(){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(top: 30.sp,bottom: 30.sp,left: 20.sp,),
    margin: EdgeInsets.only(bottom: 16.sp),
    decoration: BoxDecoration(
        color:const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title:Text(
            "Flutter Tips",
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
          subtitle: Padding(
            padding:  EdgeInsets.only(top: 20.sp,bottom:20.sp ),
            child: Text(
              "Eng Mohamed Khalid",
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black.withOpacity(.7)
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              size: 35.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.sp,),
          child: Text(
            "may21,2023",
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