import 'package:flutter/material.dart';
import 'package:kontest/utils/contest_list_generator.dart';

import '../data/contest.dart';
import '../utils/networking.dart';

class ContestByCategoryViewPage extends StatefulWidget {
  const ContestByCategoryViewPage(
      {Key? key, required this.url, required this.siteName})
      : super(key: key);
  final String siteName;
  final String url;

  @override
  State<ContestByCategoryViewPage> createState() =>
      _ContestByCategoryViewPageState();
}

class _ContestByCategoryViewPageState extends State<ContestByCategoryViewPage> {
  List<Contest> categoryContest = [];

  void getData() async {
    List<Contest> response = await getDataOfCategory(widget.url);
    setState(() {
      categoryContest = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.siteName),
            getContestsFromList(categoryContest)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
}
