import 'package:flutter/material.dart';
import 'package:kontest/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Kontest App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    ),
  );
}
