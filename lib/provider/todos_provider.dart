import 'package:class5_app/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        ]);

  void addTodo(Todo task) {
    state = [...state, task];
  }

  void deleteTask(Todo task) {
    state.remove(task);
    state = [...state];
  }

  void removeIndex(int taskIndex) {
    state.removeAt(taskIndex);
    state = [...state];
  }

  void insertAtIndex(Todo task) {
    int taskIndex = state.indexOf(task);
    state.removeAt(taskIndex);
    state.insert(taskIndex, task);
    state = [...state];
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
