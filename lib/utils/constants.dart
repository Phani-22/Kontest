import '../data/website.dart';

const String baseUrl = "https://kontests.net";
const String allContestsSubUrl = "/api/v1/all";
const String codeforcesContestsSubUrl = "/api/v1/codeforces";
const String topCoderContestsSubUrl = "/api/v1/top_coder";
const String atCoderContestsSubUrl = "/api/v1/at_coder";
const String codeChefContestsSubUrl = "/api/v1/code_chef";
const String csAcademyContestsSubUrl = "/api/v1/cs_academy";
const String hackerRankContestsSubUrl = "/api/v1/hacker_rank";
const String hackerEarthContestsSubUrl = "/api/v1/hacker_earth";
const String kickStartContestsSubUrl = "/api/v1/kick_start";
const String leetCodeContestsSubUrl = "/api/v1/leet_code";

String getNetworkImageOfContest(String websiteName) {
  websiteName = websiteName.toLowerCase();
  for (Website website in websitesList) {
    if (website.siteName == websiteName) return website.imageUrl;
  }
  return "";
}

String getWebsitesBaseUrl(String siteName) {
  switch (siteName.toLowerCase()) {
    case "codeforces":
      return codeforcesContestsSubUrl;
    case "topcoder":
      return topCoderContestsSubUrl;
    case "atcoder":
      return atCoderContestsSubUrl;
    case "cs academy":
      return csAcademyContestsSubUrl;
    case "codechef":
      return codeChefContestsSubUrl;
    case "hackerrank":
      return hackerRankContestsSubUrl;
    case "hackerearth":
      return hackerEarthContestsSubUrl;
    case "kick start":
      return kickStartContestsSubUrl;
    case "leetcode":
      return leetCodeContestsSubUrl;
  }
  return "";
}

Map<String, String> getContestsWebsite() {
  Map<String, String> curMap = {};
  for (Website website in websitesList) {
    curMap[website.siteName.toLowerCase()] = website.imageUrl;
  }
  return curMap;
}

List<Website> websitesList = [
  Website(
    "CodeForces",
    "codeforces",
    "https://codeforces.com",
    "https://play-lh.googleusercontent.com/EkSlLWf2-04k5Y5F_MDLqoXPdo0TyZX3zKdCfsEUDqVB7INUypTOd6AVmkE_X7ej3JuR",
  ),
  Website(
    "TopCoder",
    "top_coder",
    "https://topcoder.com",
    "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/tdenoarg7lu2emnoyu7c",
  ),
  Website(
    "AtCoder",
    "at_coder",
    "https://atcoder.jp",
    "https://i.ytimg.com/vi/2kGhxVdSlTQ/mqdefault.jpg",
  ),
  Website(
    "CS Academy",
    "cs_academy",
    "https://csacademy.com",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJvsSHM3x_YamYR9znjfo12Z8OLQaClnLP1TRkHoFvm-VouN9yvGDaGSGuHq4EK6ipWsM&usqp=CAU",
  ),
  Website(
    "CodeChef",
    "code_chef",
    "https://codechef.com",
    "https://static.startuptalky.com/2021/04/codechef-logo-startuptalky.jpg",
  ),
  Website(
    "HackerRank",
    "hacker_rank",
    "https://hackerrank.com",
    "https://frontlinesmedia.in/wp-content/uploads/2022/04/maxresdefault.jpg",
  ),
  Website(
    "HackerEarth",
    "hacker_earth",
    "https://hackerearth.com",
    "https://d2908q01vomqb2.cloudfront.net/cb4e5208b4cd87268b208e49452ed6e89a68e0b8/2021/07/16/HackerEarthFeatureImage.png",
  ),
  Website(
    "Kick Start",
    "kick_start",
    "https://codingcompetitions.withgoogle.com/kickstart",
    "https://repository-images.githubusercontent.com/134320311/897cdfb8-e8a8-4fcb-bda9-37561ab2ad88",
  ),
  Website(
    "LeetCode",
    "leet_code",
    "https://leetcode.com",
    "https://repository-images.githubusercontent.com/408927712/1c5ce46e-266f-43f0-b543-75bf341239b5",
  ),
  Website(
    "Toph",
    "toph",
    "https://toph.co",
    "https://toph.co/images/og/generic.png",
  ),
];
