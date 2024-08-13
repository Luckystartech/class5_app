import 'package:flutter/material.dart';
import 'package:class5_app/widgets/text_field_widget.dart';
import 'package:class5_app/widgets/date_time_widget.dart';

const kPrimaryColor = Color(0xFF148d8c);

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const TextFieldWidget(
              maxLines: 1,
              fieldTitle: 'Task Name',
            ),
            const SizedBox(height: 20.0),
            DateTimeWidget(
              title: 'Date & Time',
              hintText: '01 March, Monday',
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_outlined),
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  title: 'Start Time',
                  hintText: '09:00 AM',
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                DateTimeWidget(
                  title: 'End Time',
                  hintText: '11:00 AM',
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward),
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const TextFieldWidget(
              maxLines: 3,
              fieldTitle: 'Description',
            ),
            
          ],
        ),
      ),
    );
  }
}
