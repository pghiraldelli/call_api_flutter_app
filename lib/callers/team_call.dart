import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/team.dart';

Future<List<Team>> getTeams(teamID) async {
  if(teamID == null) return null;
  final url = 'http://flowserv.com.br/apis/times.php?EquipeID=${teamID}';

  var response = await http.get(url);

  if (_isResponseSuccess(response)) {
    var jsonTeamList = json.decode(response.body)['Times'];
    return getListOfTeamObject(jsonTeamList);
  } else {
    throw Exception('Failed to load post');
  }
}

bool _isResponseSuccess(response) {
  return (response.statusCode > 199 || response.statusCode < 400);
}

List<Team> getListOfTeamObject(jsonTeamList) {
  List<Team> teamsList = <Team>[];
  jsonTeamList.forEach((val) =>  { teamsList.add(Team.fromJSON(val)) });
  return teamsList;
}

/* POST WITH BODY EXAMPLE
var url = 'https://jsonplaceholder.typicode.com/posts';
  var body = {
    "teams":[
      {
        "id": "1",
        "nome_time": "Equipe Fagner"
      },
      {
        "id": "2",
        "nome_time": "Todos"
      }
    ]
  };
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  var response = await http.post(url, body: json.encode(body), headers: headers);
 */