import 'package:calling_api/routes/listTeams.dart';
import 'package:flutter/material.dart';


class InputTeamID extends StatefulWidget {
  @override
  _InputTeamIDState createState() => _InputTeamIDState();
}

class _InputTeamIDState extends State<InputTeamID> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Calling API'),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextField(
            controller: textFieldController,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),

        RaisedButton(
          child: Text(
            'Search teams',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            _sendDataToSecondScreen(context);
          },
        )

      ],
    ),
  );

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListTeams(teamID: textToSend,),
        ));
  }
}
