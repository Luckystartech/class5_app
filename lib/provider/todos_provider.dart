import 'package:class5_app/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:class5_app/cache/shared_preference.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
            taskName: 'Ui Design',
            date: '01 March, Monday',
            startTime: '09:00 AM',
            endTime: '11:00 AM',
            description: 'Design the UI for the app',
            isCompleted: true,
          ),
          Todo(
            taskName: 'Work out',
            date: '01 July, Monday',
            startTime: '08:00 AM',
            endTime: '09:00 AM',
            description: 'Go to the gym',
            isCompleted: true,
          ),
        ]) {
    loadcacheTodos();
  }

  void loadcacheTodos() async {
    List<Todo> todos = await loadTodos();
    if (todos.isNotEmpty){
      state = todos;
    }
  }

  void addTodo(Todo task) {
    state = [...state, task];
    saveTodos(state);
  }

  void deleteTask(Todo task) {
    state.remove(task);
    state = [...state];
    saveTodos(state);
  }

  void removeIndex(int taskIndex) {
    state.removeAt(taskIndex);
    state = [...state];
    saveTodos(state);
  }

  void insertAtIndex(Todo task) {
    int taskIndex = state.indexOf(task);
    state.removeAt(taskIndex);
    state.insert(taskIndex, task);
    state = [...state];
    saveTodos(state);
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
