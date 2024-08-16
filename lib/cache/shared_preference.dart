import 'dart:convert';
import 'package:class5_app/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';



// Save Todo Tasks
void saveTodos(List<Todo> todos) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final List<Map<String, dynamic>> todosMap =
      todos.map((todo) => todo.toMap()).toList();
  final List<String> todosString =
      todosMap.map((todos) => jsonEncode(todos)).toList();

  prefs.setStringList('todos', todosString);

  print(todosString);
}



// Load Todo Tasks
Future<List<Todo>> loadTodos() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String>? todosString = prefs.getStringList('todos');

  if (todosString != null) {
    final List<Map<String, dynamic>> todosMap = todosString
        .map((todos) => jsonDecode(todos) as Map<String, dynamic>)
        .toList();
    final List<Todo> todos =
        todosMap.map((todo) => Todo.fromMap(todo)).toList();
    return todos;
  } else {
    return [];
  }
}
