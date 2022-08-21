import 'package:flutter/material.dart';
import 'package:kontest/data/website.dart';

class WebsiteTile extends StatelessWidget {
  const WebsiteTile(
      {Key? key,
      required this.curSite,
      required this.width,
      required this.height,
      required this.onTapTask})
      : super(key: key);

  final Website curSite;
  final double width;
  final double height;
  final VoidCallback onTapTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTapTask,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                width: width,
                height: height,
                fit: BoxFit.cover,
                image: NetworkImage(curSite.imageUrl),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.67),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                curSite.siteName,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
