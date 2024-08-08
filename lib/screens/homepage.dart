import 'package:flutter/material.dart';
import 'package:class5_app/widgets/banner.dart';
import 'package:class5_app/data/dummy_data.dart';
import 'package:flutter/widgets.dart';

final kPrimaryColor = Color(0xFF148d8c);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
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
          const BannerWidget(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today\'s Task',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: todos[index].isCompleted,
                  title: Text(todos[index].taskName),
                  subtitle: Text('${todos[index].startTime} - ${todos[index].endTime}'),
                  secondary: const Icon(Icons.arrow_forward_ios),
                  onChanged: (value) {
                    setState(() {
                      todos[index].isCompleted = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 2, color: kPrimaryColor),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
