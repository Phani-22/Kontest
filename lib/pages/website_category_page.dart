import 'package:flutter/material.dart';
import 'package:kontest/data/website.dart';
import 'package:kontest/utils/constants.dart';
import 'package:kontest/widgets/website_tile.dart';

import 'category_search_contest.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Website> list = websitesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, left: 20),
            child: const Text(
              "Search by Category",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: WebsiteTile(
                      curSite: list[index],
                      width: double.infinity,
                      height: 150,
                      onTapTask: () {
                        String subUrl = getWebsitesBaseUrl(
                            list[index].siteName.toLowerCase());
                        String url = "$baseUrl$subUrl";
                        if (baseUrl == "") return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContestByCategoryViewPage(
                              url: url,
                              siteName: list[index].siteName,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
