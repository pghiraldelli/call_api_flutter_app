class Team {
  final String id;
  final String name;

  Team(this.id, this.name);

  factory Team.fromJSON(Map<String, dynamic> jsonMap) => Team(
    jsonMap['id'],
    jsonMap['nome_time']
  );
}