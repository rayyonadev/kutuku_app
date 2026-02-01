import 'package:flutter/material.dart';
import 'package:kutuku/src/ui/main/main_screen.dart';

void main()async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
