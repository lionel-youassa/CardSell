import 'package:flutter/material.dart';
import 'package:cardsell/Pages/home.dart';
import 'package:cardsell/Pages/MaketPlace.dart';
import 'package:cardsell/Pages/AddCar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async{
  await Supabase.initialize(
    url: 'https://wdjtnsxipbwexrlcupad.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkanRuc3hpcGJ3ZXhybGN1cGFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUxNjA4NzUsImV4cCI6MjA0MDczNjg3NX0.W5lNdbEARmlDGc-ZUoW0uJg71KoX9PIuqVCOLm9C_Bw',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed:   Colors.red, scaffoldBackgroundColor: Colors.white),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/MaketPlace": (context) => const MaketPlace(),
        "/AddCar": (context) => const Addcar(),

      },
    );
  }
}
