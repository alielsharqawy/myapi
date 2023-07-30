import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/model/user_todos.dart';
import '../../../services/todos_service.dart';

part 'to_dos_state.dart';

class ToDosCubit extends Cubit<ToDosState> {
  ToDosCubit() : super(ToDosInitial()) {
    gettodos();
  }

  List<UserToDos> todos = [];
  gettodos() async {
    try {
      emit(ToDosLoading());
      todos = await ToDosServices().gettodos();
      emit(ToDosSuccess());
    } catch (e) {
      print(e.toString());
      emit(ToDosError());
    }
  }
}
