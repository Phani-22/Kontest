import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/contest.dart';

class EachContestPage extends StatefulWidget {
  const EachContestPage(
      {Key? key, required this.curContest, required this.contestSite})
      : super(key: key);
  final Contest curContest;
  final String contestSite;

  @override
  State<EachContestPage> createState() => _EachContestPageState();
}

class _EachContestPageState extends State<EachContestPage> {
  void fn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.curContest.siteName,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.contestSite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.curContest.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Start Time: ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.curContest.startTime,
                    style: const TextStyle(color: Colors.black87, fontSize: 17),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "End Time: ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.curContest.endTime,
                    style: const TextStyle(color: Colors.black87, fontSize: 17),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Duration: ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.curContest.duration,
                    style: const TextStyle(color: Colors.black87, fontSize: 17),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Share.share(
                          "Check this contest by ${widget.curContest.siteName} ${widget.curContest.url}");
                    },
                    style: TextButton.styleFrom(
                        elevation: 10,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.purple),
                    child: const Text("Share Contest"),
                  ),
                  TextButton(
                    onPressed: () async {
                      var url = Uri.parse(widget.curContest.url);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        var snackBar = SnackBar(
                          content: Text(
                            "Could not launch ${widget.curContest.name}",
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: TextButton.styleFrom(
                        elevation: 10,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.purple),
                    child: const Text("Open Contest"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Add Remainder",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
