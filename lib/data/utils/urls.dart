class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static const String registrationUrl = '$_baseUrl/Registration';
  static const String loginUrl = '$_baseUrl/Login';
  static const String createNewTaskUrl = '$_baseUrl/createTask';
  static const String newTasksUrl = '$_baseUrl/listTaskByStatus/New';
  static const String progressTasksUrl = '$_baseUrl/listTaskByStatus/Progress';
  static const String completedTasksUrl = '$_baseUrl/listTaskByStatus/Completed';
  static const String cancelledTasksUrl = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskCountUrl = '$_baseUrl/taskStatusCount';
  static const String updateProfileUrl = '$_baseUrl/ProfileUpdate';

  static String changeTaskStatusUrl(String taskId, String status) =>
      '$_baseUrl/updateTaskStatus/$taskId/$status';

  static String deleteTaskUrl(String taskId) =>
      '$_baseUrl/deleteTask/$taskId';
}