import 'package:calling_api/callers/team_call.dart';
import 'package:calling_api/widgets/team_title.dart';
import 'package:flutter/material.dart';
import 'package:calling_api/models/team.dart';


class ListTeams extends StatefulWidget {
  final String teamID;

  ListTeams({Key key, @required this.teamID}) : super(key: key);

  @override
  _ListTeamsState createState() => _ListTeamsState();
}

class _ListTeamsState extends State<ListTeams> {
  List<Team> _teams = <Team>[];

  @override
  void initState() {
    super.initState();
    listenForTeam();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Calling API'),
    ),
    body: ListView.builder(
      itemCount: _teams.length,
      itemBuilder: (context, index) => TeamTitle(_teams[index]),
    ),
  );

  void listenForTeam() async {
    final List<Team> teams = await getTeams(widget.teamID);
    if(teams != null) teams.forEach((Team team) => setState(() =>  _teams.add(team)));
  }
}