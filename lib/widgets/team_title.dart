import 'package:calling_api/models/team.dart';
import 'package:flutter/material.dart';


class TeamTitle extends StatelessWidget {
  final Team _team;
  TeamTitle(this._team);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_team.name),
        subtitle: Text(_team.id.toString()),
      ),
      Divider()
    ],
  );
}
