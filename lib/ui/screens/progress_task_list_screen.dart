import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          // return TaskCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8);
        },
      ),
    );
  }
}
