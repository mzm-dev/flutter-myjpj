import 'package:flutter/material.dart';
import 'package:myjpj/pages/mydrawer.dart';
import 'package:myjpj/widgets/bottom_nav.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.token});

  final String token;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Notifikasi', style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ListView(shrinkWrap: true, children: [
          for (int i = 0; i < 20; i++)
            ListTile(
              leading: const Icon(Icons.mail),
              title: Text('Notification $i'),
              trailing: const Icon(Icons.chevron_right),
            ),
        ]),
      ),
      drawer: MyDrawer(token: widget.token),
      bottomNavigationBar:
          MyBottomNavigation(token: widget.token, selectedIndex: 1),
    );
  }
}
