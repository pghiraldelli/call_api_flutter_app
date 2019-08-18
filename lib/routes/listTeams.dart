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
  final _biggerFont = const TextStyle(fontSize: 18.0);
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
    body: _teams.length > 0 ? ListView.builder(
      itemCount: _teams.length,
      itemBuilder: (context, index) => TeamTitle(_teams[index]),
    ) : Text('There is nothing to show', style: _biggerFont),
  );

  void listenForTeam() async {
    final List<Team> teams = await getTeams(widget.teamID);
    if(teams != null) teams.forEach((Team team) => setState(() =>  _teams.add(team)));
  }
}