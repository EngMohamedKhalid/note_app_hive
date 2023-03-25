import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app_hive/layout/home_layout.dart';
import 'package:note_app_hive/models/note_model.dart';
import 'package:note_app_hive/shared/cubit/bloc_observer.dart';
import 'package:note_app_hive/shared/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes_box");
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()..getNotes())
          ],
          child: const NoteApp()
      )
  );
}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 783.2727272727273),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return child!;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0
          ),
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomeNotesLayOut(),
      ),
    );
  }
}


