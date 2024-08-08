import 'package:flutter/material.dart';

final kPrimaryColor = Color(0xFF148d8c);

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today\'s progress summary',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '15 Tasks',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Progress',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '50%',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              LinearProgressIndicator(
                                value: 0.5,
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
