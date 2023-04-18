import 'package:bottomsheet/bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: const Text('Bottom Sheet')),
          body: BottomSheett()),
    );
  }
}
