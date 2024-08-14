import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//https://apps.mampu.gov.my/myjpj/swagger/
class LoginService {
  final String url = 'https://apps.mampu.gov.my/myjpj/api';

  final dio = Dio();

  late Response response;

  LoginService();

  Future<String> login(BuildContext context, username, String password) async {
    try {
      response = await dio.post(
        '$url/login',
        data: {'username': username, 'password': password},
      );

      return response.data['JWT'];
    } on DioException {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            content: Text('Maklumat log masuk tidak sah'),
          ),
        );
      }
      return 'error';
    }
  }
}
