import 'package:flutter/material.dart';
import 'routes/inputTeamID.dart';

class CallingAPIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'First app calling API',
    theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black
    ),
    home: InputTeamID(),
  );
}