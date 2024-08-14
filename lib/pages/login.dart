import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjpj/pages/homepage.dart';
import 'package:myjpj/routings.dart';
import 'package:myjpj/services/login.dart';

import 'logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool disabled = true;

  final _formKey = GlobalKey<FormState>();

  var token = '';

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Login', style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(radius: 20, sizes: 50),
              const SizedBox(height: 50),
              TextFormField(
                controller: usernameCtrl,
                onChanged: (value) => validate(),
                maxLength: 12,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sila masukkan No Kad Pengenalan';
                  } else if (value.length < 12) {
                    return 'Sila masukkan No Kad Pengenalan yang betul';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    labelText: 'Id Pengguna',
                    hintText: 'Sila masukkan No Kad Pengenalan',
                    hintStyle: TextStyle(color: Colors.blue),
                    icon: Icon(Icons.person)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordCtrl,
                onChanged: (value) => validate(),
                maxLength: 30,
                obscureText: true,
                decoration: const InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    labelText: 'Kata Laluan',
                    hintText: 'Sila masukkan kata laluan',
                    hintStyle: TextStyle(color: Colors.blue),
                    icon: Icon(Icons.lock)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: disabled
                    ? null
                    : () {
                        goToHomePage(context);
                      },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // foreground
                ),
                child: const Text('Log Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validate() {
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      setState(() {
        disabled = false;
      });
    } else {
      setState(() {
        disabled = true;
      });
    }
  }

  goToHomePage(BuildContext context) async {
    // Form Validation
    if (_formKey.currentState!.validate()) {
      // Login Service
      LoginService loginService = LoginService();

      String response = await loginService.login(
          context, usernameCtrl.text, passwordCtrl.text);

      if (response != 'error') {
        Routings.onTapLink(context, MyHomePage(token: response));
      }
    }
  }
}
