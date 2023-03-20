import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customStatelessTextField({
  EdgeInsetsGeometry? padding,
  final String? hintText,
  final TextEditingController? controller,
  final TextInputType? keyType,
  final Widget? prefix,
  final VoidCallback? onTap,
  final int? maxLines
})=>Container(
  padding: padding,
  child: TextFormField(
    validator: (value) {
      if(value!.isEmpty){
        return "$hintText must not be empty";
      }
      return null;
    },
    keyboardType: keyType,
    maxLines: maxLines,
    controller: controller,
    cursorColor:const Color(0xff62FCD7),
    style:  TextStyle(
        color:const Color(0xff62FCD7),
        fontSize: 20.sp),
    decoration: InputDecoration(
      prefixIcon: prefix,
      errorStyle:const TextStyle(
        color: Colors.amber,
        fontSize: 18
      ),
      floatingLabelStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: const BorderSide(color: Colors.white)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: const BorderSide(color: Colors.deepOrange)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: const BorderSide(color: Color(0xff62FCD7))),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.sp),
      ),
      //label: Text(text!),
      hintText: hintText,
      hintStyle: const TextStyle(
          color: Color(0xff62FCD7)
      ),
      labelStyle:  TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        // fontWeight: FontWeight.bold
      ),

    ),
    onTap: onTap,
  ),
);
