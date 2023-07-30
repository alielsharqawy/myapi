import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/view/cubit/cubit/to_dos_cubit.dart';
import 'package:todos/view/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDosCubit(),
      child: BlocConsumer<ToDosCubit, ToDosState>(
        listener: (context, state) {},
        builder: (context, state) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoScreenlist(),
        ),
      ),
    );
  }
}
