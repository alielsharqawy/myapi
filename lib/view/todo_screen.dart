import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/view/cubit/cubit/to_dos_cubit.dart';

class TodoScreenlist extends StatefulWidget {
  const TodoScreenlist({super.key});

  @override
  State<TodoScreenlist> createState() => _TodoScreenlistState();
}

class _TodoScreenlistState extends State<TodoScreenlist> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDosCubit, ToDosState>(listener: (context, state) {
      if (state is ToDosLoading) {
        // ignore: avoid_print
        print("Loading");
      }
    }, builder: (context, state) {
      return Scaffold(
        body: state is ToDosLoading
          ? const Center(child: CircularProgressIndicator())
          : state is ToDosSuccess
              ? ListView.builder(
                  itemCount: context.watch<ToDosCubit>().todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        context.watch<ToDosCubit>().todos[index].title ?? "",
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Error"),
                ));
    });
  }
}
