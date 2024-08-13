import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF148d8c);

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.totalTasks,
    required this.progressIndicatorValue,
  });

  final int totalTasks;
  final double progressIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kPrimaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today\'s progress summary',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${totalTasks.toString()} Tasks',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 10
          ),
          Expanded(
            child: Row(
              children: [
                const Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                          left: 60,
                          child: CircleAvatar(
                            // child: Text('L'),
                            child: Text('L'),
                            radius: 24,
                          )),
                      Positioned(
                          left: 30,
                          child: CircleAvatar(
                            child: Text('L'),
                            radius: 24,
                          )),
                      Positioned(
                          left: 0,
                          child: CircleAvatar(
                            child: Text('L'),
                            radius: 24,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Progress',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${(progressIndicatorValue * 100).round()}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: progressIndicatorValue,
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
