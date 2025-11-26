class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static const String registrationUrl = '$_baseUrl/Registration';
  static const String loginUrl = '$_baseUrl/Login';
  static const String createNewTaskUrl = '$_baseUrl/createTask';
  static const String newTasksUrl = '$_baseUrl/listTaskByStatus/New';
  static const String progressTasksUrl = '$_baseUrl/listTaskByStatus/Progress';
  static const String taskCountUrl = '$_baseUrl/taskStatusCount';

  static String changeTaskStatusUrl(String taskId, String status) =>
      '$_baseUrl/updateTaskStatus/$taskId/$status';

  static String deleteTaskUrl(String taskId) =>
      '$_baseUrl/deleteTask/$taskId';
}