import 'package:flutter/material.dart';

import '../data/contest.dart';
import '../utils/contest_list_generator.dart';
import '../utils/networking.dart';

class UpcomingContestsPage extends StatefulWidget {
  const UpcomingContestsPage({Key? key}) : super(key: key);

  @override
  State<UpcomingContestsPage> createState() => _UpcomingContestsPageState();
}

class _UpcomingContestsPageState extends State<UpcomingContestsPage> {
  List<Contest> in24HoursContestList = [];
  List<Contest> allContests = [];

  void setDataIntoList() async {
    List<Contest> upcoming = await getContestsIn24Hrs();
    List<Contest> all = await getDataFromApi();
    setState(() {
      in24HoursContestList = upcoming;
      allContests = all;
    });
  }

  @override
  void initState() {
    setDataIntoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, left: 20),
            child: const Text(
              "Contests within 24 hours",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ),
          getContestsFromList(in24HoursContestList),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              color: Colors.black87.withOpacity(0.5),
              height: 10,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, left: 20),
            child: const Text(
              "All Contests",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ),
          getContestsFromList(allContests)
        ],
      ),
    );
  }
}
