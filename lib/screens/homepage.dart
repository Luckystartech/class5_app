import 'package:class5_app/model/todo.dart';
import 'package:class5_app/provider/color_provider.dart';
import 'package:class5_app/provider/todos_provider.dart';
import 'package:class5_app/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:class5_app/widgets/banner.dart';
// import 'package:class5_app/data/dummy_data.dart';
import 'package:class5_app/screens/edit_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
    @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color kPrimaryColor = ref.watch(colorProvider);
    List<Todo> todos = ref.watch(todosProvider);

    double progressValue = todos.isEmpty
        ? 0
        : todos.where((todo) {
              return todo.isCompleted == true;
            }).length /
            todos.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        leading: const Icon(Icons.menu),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 30),
          BannerWidget(
            totalTasks: todos.length,
            progressIndicatorValue: progressValue,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today\'s Task',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Tasks();
                  }));
                },
                child: const Text('See All'),
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: todos.isEmpty
                ? const Center(
                    child: Text('No Task Found'),
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
                          secondary: const Icon(Icons.arrow_forward_ios),
                          onChanged: (value) {
                            // setState(() {
                              todos[index].isCompleted = value!;
                              ref.read(todosProvider.notifier).insertAtIndex(todos[index]);
                            // });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              width: 2,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const EditTaskScreen();
          }));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
