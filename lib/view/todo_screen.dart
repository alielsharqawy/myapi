import 'package:flutter/material.dart';
import 'package:todos/model/user_todos.dart';
import 'package:todos/services/todos_service.dart';

class TodoScreenlist extends StatefulWidget {
  const TodoScreenlist({super.key});

  @override
  State<TodoScreenlist> createState() => _TodoScreenlistState();
}

class _TodoScreenlistState extends State<TodoScreenlist> {
  List<UserToDos> todos = [];
  bool isloading = true;
  gettodo() async {
    todos = await ToDosServices().gettodos();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(todos[index].title ?? ""),
                  );
                },
              ));
  }
}
