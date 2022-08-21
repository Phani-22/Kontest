import 'package:flutter/material.dart';
import 'package:kontest/pages/contest_view_page.dart';

import '../data/contest.dart';

class ContestTile extends StatelessWidget {
  const ContestTile(
      {Key? key, required this.curContest, required this.contestSite})
      : super(key: key);

  final Contest curContest;
  final String contestSite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 6,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EachContestPage(
                  curContest: curContest, contestSite: contestSite),
            ),
          );
        },
        child: Hero(
          tag: curContest.url,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                      image: NetworkImage(contestSite),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    curContest.name,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
