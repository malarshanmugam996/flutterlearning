import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? fid = await FirebaseInstallations.instance.getId();
  print("Firebase Installation ID: $fid");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase In-App Messaging',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

  @override
  void initState() {
    super.initState();
    fiam.triggerEvent("app_open");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In-App Messaging")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fiam.triggerEvent("custom_event");
          },
          child: Text("Trigger Custom Event"),
        ),
      ),
    );
  }
}
