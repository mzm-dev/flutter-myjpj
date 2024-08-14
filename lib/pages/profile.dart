import 'package:flutter/material.dart';
import 'package:myjpj/pages/mydrawer.dart';
import 'package:myjpj/widgets/bottom_nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.token});

  final String token;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('Profile', style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('profile.jpg'),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mohamad Zaki bin Mustafa'),
                  Text('mzm@ns.gov.my'),
                ],
              ),
              // title: Text('Nama : Mohamad Zaki bin Mustafa'),
              // subtitle: Text('Email : mzm@ns.gov.my'),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(token: widget.token),
      bottomNavigationBar:
          MyBottomNavigation(token: widget.token, selectedIndex: 2),
    );
  }
}
