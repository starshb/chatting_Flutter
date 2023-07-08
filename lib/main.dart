import 'package:chatting/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async {
  await Supabase.initialize(url: 'https://golmzpnwrtukwmquxtdn.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdvbG16cG53cnR1a3dtcXV4dGRuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODM4MjQwNzQsImV4cCI6MTk5OTQwMDA3NH0.mC-wK10CsvVanrsIWuhSm30GlBHTo6p-_bqKrgvie4E');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainPage(
        ),
      ),
    );
  }
}

