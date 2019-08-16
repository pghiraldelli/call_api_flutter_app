import 'package:calling_api/callers/team_call.dart';
import 'package:calling_api/widgets/team_title.dart';
import 'package:flutter/material.dart';
import 'package:calling_api/models/team.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    final List<Team> teams = await getTeams();
    teams.forEach((Team team) => setState(() =>  _teams.add(team)));
  }
}