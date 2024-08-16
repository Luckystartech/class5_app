// import 'package:class5_app/data/dummy_data.dart';
import 'package:class5_app/model/todo.dart';
import 'package:class5_app/provider/color_provider.dart';
import 'package:class5_app/provider/todos_provider.dart';
import 'package:class5_app/screens/edit_task.dart';
import 'package:class5_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tasks extends ConsumerWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color kPrimaryColor = ref.watch(colorProvider);
    List<Todo> todos = ref.watch(todosProvider);

    // Delete Task
    void onDelete(Todo task) {
          ref.read(todosProvider.notifier).deleteTask(task);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 30),
          backgroundColor: kPrimaryColor,
          content: const Text('Delete Successfully'),
        ),
      );
    }

    // Edit Task
    void onEdit(Todo task) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return EditTaskScreen(
          task: task,
          taskIndex: todos.indexOf(task),
        );
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add_outlined),
          )
        ],
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: todos.isEmpty
            ? const Center(
                child: Text('No Task found'),
              )
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CheckboxListTile(
                      value: todos[index].isCompleted,
                      title: Text(todos[index].taskName),
                      subtitle: Text(
                          '${todos[index].startTime} - ${todos[index].endTime}'),
                      secondary: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              onEdit(todos[index]);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              onDelete(todos[index]);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      onChanged: (value) {
                          todos[index].isCompleted = value!;
                          ref.read(todosProvider.notifier).insertAtIndex(todos[index]);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 2, color: kPrimaryColor),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
