import 'package:flutter/material.dart';
import 'package:myjpj/pages/homepage.dart';
import 'package:myjpj/pages/login.dart';
import 'package:myjpj/pages/notification.dart';
import 'package:myjpj/pages/profile.dart';
import 'package:myjpj/routings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.token,
  });

  final String token;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Selamat Datang Mohamad Zaki'),
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('profile.jpg'),
          ),
          const SizedBox(height: 20),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Laman Utama'),
            onTap: () {
              //  Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => const MyHomePage()));
              Routings.onTapLink(context, MyHomePage(token: widget.token));
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Notifikasi'),
            onTap: () {
              //  Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => const MyHomePage()));
              Routings.onTapLink(
                  context, NotificationPage(token: widget.token));
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              //  Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => const MyHomePage()));
              Routings.onTapLink(context, ProfilePage(token: widget.token));
            },
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Keluar'),
            onTap: () {
              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => const LoginPage()));
              Routings.onTapLink(context, const LoginPage());
            },
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
