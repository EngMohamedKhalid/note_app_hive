import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNotesLayOut extends StatelessWidget {
  const HomeNotesLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35.sp,
        ),
      ),
    );
  }
}
