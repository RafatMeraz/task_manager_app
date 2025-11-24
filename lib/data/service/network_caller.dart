import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:task_manager_app/app.dart';
import 'package:task_manager_app/ui/controllers/auth_controller.dart';
import 'package:task_manager_app/ui/screens/sign_in_screen.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url);
      Response response = await get(uri, headers: {
        'token': AuthController.accessToken ?? ''
      });
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        _onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            responseCode: response.statusCode,
            errorMessage: 'Un-authorize'
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data']
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.accessToken ?? ''
        },
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        _onUnauthorize();
        return NetworkResponse(
            isSuccess: false,
            responseCode: response.statusCode,
            errorMessage: 'Un-authorize'
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data']
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<void> _onUnauthorize() async {
    await AuthController.clearUserData();
    Navigator.pushNamed(
      TaskManagerApp.navigatorKey.currentContext!, SignInScreen.name,
    );
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    debugPrint(
      'URL: $url\n'
      'Body: $body',
    );
  }

  static void _logResponse(String url, Response response) {
    debugPrint(
      'URL: $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}

class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMessage = 'Something went wrong!',
  });
}
