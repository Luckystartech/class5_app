import 'package:class5_app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:class5_app/widgets/text_field_widget.dart';
import 'package:class5_app/widgets/date_time_widget.dart';
import 'package:intl/intl.dart';
import 'package:class5_app/model/todo.dart';
import 'package:class5_app/data/dummy_data.dart';

const kPrimaryColor = Color(0xFF148d8c);

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final taskNameController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedDate = '';
  String startTime = '';
  String endTime = '';

  void onSelectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = DateFormat('yy MMMM, EEEE').format(pickedDate);
      });
    }
  }

  DateTime formatter(TimeOfDay time) {
    final now = DateTime.now();
    DateTime newDate =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return newDate;
  }

  void onSelectStartTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = DateFormat('h:mm a').format(formatter(pickedTime));
      });
    }
  }

  void onSelectEndTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = DateFormat('h:mm a').format(formatter(pickedTime));
      });
    }
  }

  void onSubmitTask() {
    setState(() {
      taskNameController.clear();
      descriptionController.clear();
      selectedDate = '';
      startTime = '';
      endTime = '';

      // showDialog(context: context, builder: (context){
      //   return AlertDialog(
      //     title: const Text('Task Added Successfully'),
      //   );
      // });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 30),
          backgroundColor: kPrimaryColor,
          content: Text('Task Added Successfully'),
        ),
      );

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        // leading: const Icon(Icons.menu),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            TextFieldWidget(
              controller: taskNameController,
              maxLines: 1,
              fieldTitle: 'Task Name',
            ),
            const SizedBox(height: 20.0),
            DateTimeWidget(
              title: 'Date & Time',
              hintText: selectedDate,
              onPressed: () {
                onSelectDate();
              },
              icon: const Icon(Icons.calendar_month_outlined),
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  title: 'Start Time',
                  hintText: startTime,
                  onPressed: () {
                    onSelectStartTime();
                  },
                  icon: const Icon(Icons.arrow_downward),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                DateTimeWidget(
                  title: 'End Time',
                  hintText: endTime,
                  onPressed: () {
                    onSelectEndTime();
                  },
                  icon: const Icon(Icons.arrow_downward),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            TextFieldWidget(
              controller: descriptionController,
              maxLines: 3,
              fieldTitle: 'Description',
            ),
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                if (taskNameController.text.trim().isNotEmpty &&
                    descriptionController.text.trim().isNotEmpty &&
                    startTime != '' &&
                    endTime != '') {
                  Todo newTask = Todo(
                    taskName: taskNameController.text.trim(),
                    date: selectedDate,
                    startTime: startTime,
                    endTime: endTime,
                    description: descriptionController.text.trim(),
                  );

                  todos.add(newTask);
                  onSubmitTask();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      // duration: Duration(milliseconds: 30),
                      backgroundColor: kPrimaryColor,
                      content: Text('Please Fill all Fields'),
                    ),
                  );
                }
              },
              child: const Text(
                'Edit Done',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 60),
                  backgroundColor: Colors.deepPurple.shade400,
                  shape: const RoundedRectangleBorder()),
            )
          ],
        ),
      ),
    );
  }
}
