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
    return BlocProvider(
      create: (context) => ToDosCubit(),
      child: BlocConsumer(
        listener: (context, state) {
          if (state is ToDosLoading) {
            print("Loading");
          }
        },
        builder: (context, state) {
          return state is ToDosLoading
              ? Center(child: CircularProgressIndicator())
              : state is ToDosSuccess
                  ? ListView.builder(
                      itemCount: context.watch<ToDosCubit>().todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              context.watch<ToDosCubit>().todos[index].title ??
                                  ""),
                        );
                      },
                    )
                  : Center(
                      child: Text("Error"),
                    );
        },
      ),
    );
  }
}
