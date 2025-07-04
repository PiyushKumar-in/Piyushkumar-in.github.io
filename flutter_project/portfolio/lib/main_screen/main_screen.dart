import 'package:flutter/material.dart';
import 'package:portfolio/main_screen/elements/main_scroll_view.dart';
import 'package:portfolio/main_screen/elements/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final projectsFN = GlobalKey();
  final skillsFN = GlobalKey();
  final educationFN = GlobalKey();
  final aboutFN = GlobalKey();
  final contactMeFN = GlobalKey();
  final scrlcnt = ScrollController();

  @override
  void dispose() {
    scrlcnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    if (maxWidth > 1100) {
      return Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 0,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavbarFullSize(
              projectsFN: projectsFN,
              skillsFN: skillsFN,
              educationFN: educationFN,
              aboutFN: aboutFN,
              srclcnt: scrlcnt,
              contactMeFN: contactMeFN,
            ),
            VerticalDivider(width: 1),
            Expanded(
              child: MainScrollView(
                scrollController: scrlcnt,
                aboutFN: aboutFN,
                skillsFN: skillsFN,
                educationFN: educationFN,
                projectsFN: projectsFN,
                contactMeFN: contactMeFN,
              ),
            ),
          ],
        ),
      );
    }

    if (maxWidth > 700) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Piyush Kumar",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextInNavBar(
              text: "Projects",
              number: "01",
              fn: projectsFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "Skills",
              number: "02",
              fn: skillsFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "Education",
              number: "03",
              fn: educationFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "About",
              number: "04",
              fn: aboutFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            InkWell(
              child: Text("Contact me"),
              onTap: () {
                if (contactMeFN.currentContext != null) {
                  Scrollable.ensureVisible(
                    contactMeFN.currentContext!,
                    duration: Duration(milliseconds: 500),
                  );
                }
              },
            ),
            SizedBox(width: 20),
            InkWell(
              child: Text("Github"),
              onTap: () async {
                await launchUrl(
                  Uri.parse('https://github.com/PiyushKumar-in/'),
                );
              },
            ),
            SizedBox(width: 20),
          ],
        ),
        body: MainScrollView(
          scrollController: scrlcnt,
          aboutFN: aboutFN,
          skillsFN: skillsFN,
          educationFN: educationFN,
          projectsFN: projectsFN,
          contactMeFN: contactMeFN,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        bottom: AppBar(
          actions: [
            TextInNavBar(
              text: "Projects",
              number: "01",
              fn: projectsFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "Skills",
              number: "02",
              fn: skillsFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "Education",
              number: "03",
              fn: educationFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
            TextInNavBar(
              text: "About",
              number: "04",
              fn: aboutFN,
              scrollController: scrlcnt,
            ),
            SizedBox(width: 20),
          ],
        ),

        // (500,15) (550,40) (600,70) (650, 90)
        title: Text(
          "Piyush Kumar",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            child: Text("Contact me"),
            onTap: () {
              if (contactMeFN.currentContext != null) {
                Scrollable.ensureVisible(
                  contactMeFN.currentContext!,
                  duration: Duration(milliseconds: 500),
                );
              }
            },
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text("Github"),
            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/PiyushKumar-in/'));
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      body: MainScrollView(
        scrollController: scrlcnt,
        aboutFN: aboutFN,
        skillsFN: skillsFN,
        educationFN: educationFN,
        projectsFN: projectsFN,
        contactMeFN: contactMeFN,
      ),
    );
  }
}
