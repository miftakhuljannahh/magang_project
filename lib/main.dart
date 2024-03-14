// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tes_login/login.dart';
import 'package:tes_login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://glmouqtxifsafziseehx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdsbW91cXR4aWZzYWZ6aXNlZWh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAyNTY5MDQsImV4cCI6MjAyNTgzMjkwNH0.QX_-5GmzBWNHCH1wWqC7yA0ADGpRqarzwsLNDo4m3ws',
  );

  runApp(MyApp());
}

// final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
