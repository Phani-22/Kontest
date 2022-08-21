import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/contest.dart';
import 'constants.dart';

List<Contest> allContests = [];
List<Contest> curOngoingContest = [];
List<Contest> in24HoursContest = [];

Future<List<Contest>> getOngoingContests() async {
  List<Contest> response = await getDataFromApi();
  List<Contest> curList = [];
  for (Contest contest in response) {
    if (contest.isOngoing == "CODING") {
      curList.add(contest);
    }
  }
  return curList;
}

Future<List<Contest>> getContestsIn24Hrs() async {
  List<Contest> response = await getDataFromApi();
  List<Contest> curList = [];
  for (Contest contest in response) {
    if (contest.in24Hours == "Yes") {
      curList.add(contest);
    }
  }
  return curList;
}

Future<List<Contest>> getDataFromApi() async {
  if (allContests.isEmpty) {
    var response = await _getData();
    allContests = response;
  }
  return allContests;
}

Future<List<Contest>> refreshAndGetData() async {
  var response = await _getData();
  allContests = response;
  return allContests;
}

Future<List<Contest>> _getData() async {
  List<Contest> curList = [];
  String allContestsUrl = "$baseUrl$allContestsSubUrl";
  var response = await http.get(Uri.parse(allContestsUrl));
  List<dynamic> jsonData = jsonDecode(response.body);
  for (var element in jsonData) {
    Contest curContest = Contest(
      element["name"],
      element["url"],
      element["start_time"],
      element["end_time"],
      element["duration"],
      element["site"],
      element["in_24_hours"],
      element["status"],
    );
    curList.add(curContest);
  }
  return curList;
}

Future<List<Contest>> getDataOfCategory(String url) async {
  List<Contest> curList = [];
  var response = await http.get(Uri.parse(url));
  List<dynamic> jsonData = jsonDecode(response.body);
  for (var element in jsonData) {
    Contest curContest = Contest(
      element["name"],
      element["url"],
      element["start_time"],
      element["end_time"],
      element["duration"],
      element["site"],
      element["in_24_hours"],
      element["status"],
    );
    curList.add(curContest);
  }
  print(curList);
  return curList;
}

void main() {
  String url = "$baseUrl$codeforcesContestsSubUrl";
  getDataOfCategory(url);
}
