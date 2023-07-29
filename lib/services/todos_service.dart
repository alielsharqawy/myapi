import 'package:dio/dio.dart';
import 'package:todos/model/user_todos.dart';

class ToDosServices {
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<UserToDos>> gettodos() async {
    List<UserToDos> todos = [];
    Response response = await Dio().get(url);
    var data = response.data;
    data.forEach((element){
      UserToDos todo=UserToDos.fromJson(element);
      todos.add(todo);
    });
    return todos;
  }
}
