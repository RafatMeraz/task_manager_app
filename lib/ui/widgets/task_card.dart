import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(taskModel.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.description,
              style: TextStyle(color: Colors.grey),
            ),
            Text('Date: ${taskModel.createdDate}'),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    taskModel.status,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
