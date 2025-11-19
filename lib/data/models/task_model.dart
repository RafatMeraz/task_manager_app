import 'package:intl/intl.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String email;
  final String createdDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.email,
    required this.createdDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      description: jsonData['description'],
      status: jsonData['status'],
      email: jsonData['email'],
      createdDate: DateFormat().format(DateTime.parse(jsonData['createdDate'])),
    );
  }
}
