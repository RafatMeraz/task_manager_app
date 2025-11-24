import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/service/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/centered_circular_progress.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.refreshList,
  });

  final TaskModel taskModel;
  final VoidCallback refreshList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _changeStatusInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(widget.taskModel.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.description,
              style: TextStyle(color: Colors.grey),
            ),
            Text('Date: ${widget.taskModel.createdDate}'),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(widget.taskModel.status),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.taskModel.status,
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
                Visibility(
                  visible: _changeStatusInProgress == false,
                  replacement: CenteredCircularProgress(),
                  child: IconButton(
                    onPressed: () {
                      _showChangeStatusDialog();
                    },
                    icon: Icon(Icons.edit, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeStatusDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('New'),
                trailing: _isCurrentStatus('New') ? Icon(Icons.done) : null,
                onTap: () {
                  _onTapChangeTaskTile('New');
                },
              ),
              ListTile(
                title: Text('Progress'),
                trailing: _isCurrentStatus('Progress')
                    ? Icon(Icons.done)
                    : null,
                onTap: () {
                  _onTapChangeTaskTile('Progress');
                },
              ),
              ListTile(
                title: Text('Cancelled'),
                trailing: _isCurrentStatus('Cancelled')
                    ? Icon(Icons.done)
                    : null,
                onTap: () {
                  _onTapChangeTaskTile('Cancelled');
                },
              ),
              ListTile(
                title: Text('Completed'),
                trailing: _isCurrentStatus('Completed')
                    ? Icon(Icons.done)
                    : null,
                onTap: () {
                  _onTapChangeTaskTile('Completed');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTapChangeTaskTile(String status) {
    if (_isCurrentStatus(status)) return;

    Navigator.pop(context);

    _changeStatus(status);
  }

  bool _isCurrentStatus(String status) {
    return widget.taskModel.status == status;
  }

  Future<void> _changeStatus(String status) async {
    _changeStatusInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.changeTaskStatusUrl(widget.taskModel.id, status),
    );
    if (response.isSuccess) {
      widget.refreshList();
    } else {
      _changeStatusInProgress = false;
      setState(() {});
      showSnackBarMessage(context, response.errorMessage);
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'New':
        return Colors.blue;
      case 'Progress':
        return Colors.amber;
      case 'Cancelled':
        return Colors.red;
      case 'Completed':
        return Colors.green;
      default:
        return Colors.pink;
    }
  }
}
