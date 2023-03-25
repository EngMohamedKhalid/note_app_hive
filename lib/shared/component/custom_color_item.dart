import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_hive/shared/component/notes_colors.dart';
import 'package:note_app_hive/shared/cubit/cubit.dart';
import 'package:note_app_hive/shared/cubit/states.dart';

class CustomColorItem extends StatelessWidget {
  const CustomColorItem({Key? key, required this.index}) : super(key: key);
final int index ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.getObject(context);
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              cubit.changeColor(index);
              cubit.color = colors[index];
            },
            child: cubit.current == index ? CircleAvatar(
              radius: 35.r,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: colors[index],
              ),
            ) : CircleAvatar(
              radius: 35.r,
              backgroundColor: colors[index],
            ),
          ),
        );
      },
    );
  }
}
