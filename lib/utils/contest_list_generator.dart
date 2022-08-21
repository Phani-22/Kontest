import 'package:flutter/material.dart';
import 'package:kontest/utils/constants.dart';

import '../data/contest.dart';
import '../widgets/contest_tile.dart';

Widget getContestsFromList(List<Contest> curList) {
  Map<String, String> contestMap = getContestsWebsite();
  if (curList.isEmpty) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(36),
        child: Image(
          image: AssetImage("images/empty.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: curList.length,
        itemBuilder: (context, index) {
          return ContestTile(
            curContest: curList[index],
            contestSite:
                contestMap[curList[index].siteName.toLowerCase()] ?? "",
          );
        },
      ),
    ),
  );
}
