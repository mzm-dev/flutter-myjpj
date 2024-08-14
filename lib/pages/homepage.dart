import 'package:flutter/material.dart';
import 'package:myjpj/pages/mydrawer.dart';
import 'package:myjpj/services/profile.dart';
import 'package:myjpj/widgets/bottom_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.token});

  final String token;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? uuid;
  String? namaPengguna;
  String? emel;

  @override
  void initState() {
    // Get User Profile
    getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('My JPJ', style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                    leading: const CircleAvatar(
                      // radius: 50,
                      backgroundImage: AssetImage('profile.jpg'),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama : $namaPengguna'),
                        Text('Email : $emel'),
                        Text("UUID : ${uuid}"),
                        Text("Token : ${widget.token}"),
                      ],
                    )
                    // title: Text('Nama : Mohamad Zaki bin Mustafa'),
                    // subtitle: Text('Email : mzm@ns.gov.my'),
                    ),
              ],
            ),
          ],
        ),
      ),
      drawer: MyDrawer(token: widget.token),
      bottomNavigationBar:
          MyBottomNavigation(token: widget.token, selectedIndex: 0),
    );
  }

  // Get User Profile
  getUserProfile() async {
    // Profile Service
    ProfileService profileService = ProfileService();

    // Get User Profile
    List<dynamic> response = await profileService.users(context, widget.token);

    var user = response[0];

    // Set User Profile
    setState(() {
      uuid = user['uuid'];
      namaPengguna = user['nama_pengguna'];
      emel = user['emel'];
    });
  }
}
