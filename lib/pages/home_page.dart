import 'package:flutter/material.dart';
import 'package:kontest/data/website.dart';
import 'package:kontest/utils/constants.dart';
import 'package:kontest/widgets/website_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/contest.dart';
import '../utils/contest_list_generator.dart';
import '../utils/networking.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Website> list = websitesList;
  List<Contest> allContestsList = [];

  void getContests() async {
    List<Contest> curList = await getOngoingContests();
    setState(() {
      allContestsList = curList;
    });
  }

  @override
  void initState() {
    getContests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      child: const Icon(
                        Icons.headphones,
                        size: 24,
                      ),
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "Phani",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      child: const Icon(
                        Icons.notifications,
                        size: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12, left: 20),
          child: const Text(
            "Popular Sites",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 135,
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return WebsiteTile(
                curSite: list[index],
                width: 150,
                height: 125,
                onTapTask: () async {
                  var url = Uri.parse(list[index].siteUrl);
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    var snackBar = SnackBar(
                      content: Text(
                        "Could not launch ${list[index].siteName}",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 12, left: 20),
          child: const Text(
            "Ongoing Contests",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ),
        getContestsFromList(allContestsList)
      ],
    );
  }
}
