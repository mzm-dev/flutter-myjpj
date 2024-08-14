import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//https://apps.mampu.gov.my/myjpj/swagger/
class ProfileService {
  final String url = 'https://apps.mampu.gov.my/myjpj/api';

  final dio = Dio();

  late Response response;

  ProfileService();

  Future<List<dynamic>> users(BuildContext context, String token) async {
    try {
      dio.options.headers["X-Authorization"] = token;

      response = await dio.get('$url/list/users');

      List<dynamic> jsonData = response.data['users'];
      return jsonData; // Return the parsed JSON data
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

      return [];
    }
  }
}
