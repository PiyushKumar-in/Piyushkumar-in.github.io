import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavbarFullSize extends StatefulWidget {
  const NavbarFullSize({
    super.key,
    required this.aboutFN,
    required this.educationFN,
    required this.projectsFN,
    required this.skillsFN,
    required this.srclcnt,
    required this.contactMeFN,
  });
  final GlobalKey aboutFN;
  final GlobalKey educationFN;
  final GlobalKey skillsFN;
  final GlobalKey projectsFN;
  final GlobalKey contactMeFN;
  final ScrollController srclcnt;
  @override
  State<NavbarFullSize> createState() => _NavbarFullSizeState();
}

class _NavbarFullSizeState extends State<NavbarFullSize> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 0,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Text(
              "Piyush Kumar",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                TextInNavBar(
                  text: "Projects",
                  number: "01",
                  fn: widget.projectsFN,
                  scrollController: widget.srclcnt,
                ),
                TextInNavBar(
                  text: "Skills",
                  number: "02",
                  fn: widget.skillsFN,
                  scrollController: widget.srclcnt,
                ),
                TextInNavBar(
                  text: "Education",
                  number: "03",
                  fn: widget.educationFN,
                  scrollController: widget.srclcnt,
                ),
                TextInNavBar(
                  text: "About",
                  number: "04",
                  fn: widget.aboutFN,
                  scrollController: widget.srclcnt,
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Text("Contact me"),
                  onTap: () {
                    if (widget.contactMeFN.currentContext != null) {
                      Scrollable.ensureVisible(
                        widget.contactMeFN.currentContext!,
                        duration: Duration(milliseconds: 500),
                      );
                    }
                  },
                ),
                InkWell(
                  child: Text("Github"),
                  onTap: () async {
                    await launchUrl(
                      Uri.parse('https://github.com/PiyushKumar-in/'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextInNavBar extends StatefulWidget {
  const TextInNavBar({
    super.key,
    required this.text,
    required this.number,
    required this.fn,
    required this.scrollController,
  });

  final String text;
  final String number;
  final GlobalKey fn;
  final ScrollController scrollController;

  @override
  State<TextInNavBar> createState() => _TextInNavBarState();
}

class _TextInNavBarState extends State<TextInNavBar> {
  TextStyle? style1;
  TextStyle? style2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) {
      setState(() {
        style1 = Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
        style2 = Theme.of(context).textTheme.bodySmall!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          style1 = Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.tertiary.withAlpha(200),
          );
          style2 = Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          );
        });
      },
      onExit: (event) {
        setState(() {
          style1 = Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
          style2 = Theme.of(context).textTheme.bodySmall!;
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.fn.currentContext != null) {
            Scrollable.ensureVisible(
              widget.fn.currentContext!,
              duration: Duration(milliseconds: 500),
            );
          }
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: widget.text, style: style1),
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, -5),
                  child: Text(widget.number, style: style2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
