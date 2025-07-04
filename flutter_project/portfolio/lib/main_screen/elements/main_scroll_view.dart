import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/view/milestone_timeline.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScrollView extends StatefulWidget {
  const MainScrollView({
    super.key,
    required this.scrollController,
    required this.aboutFN,
    required this.educationFN,
    required this.projectsFN,
    required this.skillsFN,
    required this.contactMeFN
  });
  final GlobalKey aboutFN;
  final GlobalKey projectsFN;
  final GlobalKey educationFN;
  final GlobalKey skillsFN;
  final GlobalKey contactMeFN;
  final ScrollController scrollController;

  @override
  State<MainScrollView> createState() => _MainScrollViewState();
}

class _MainScrollViewState extends State<MainScrollView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainScreenBackground(),
          Divider(height: 1),
          SizedBox(height: 30),
          Introduction(),
          SizedBox(height: 70),
          Divider(height: 1),
          SizedBox(height: 20),
          Projects(key: widget.projectsFN),
          SizedBox(height: 70),
          Divider(height: 1),
          SizedBox(height: 30),
          Skills(key: widget.skillsFN),
          SizedBox(height: 70),
          Divider(height: 1),
          SizedBox(height: 30),
          Education(key: widget.educationFN),
          SizedBox(height: 70),
          Divider(height: 1),
          SizedBox(height: 30),
          About(key: widget.aboutFN),
          SizedBox(height: 70),
          Divider(height: 1),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Piyush Kumar",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Row(
                  key: widget.contactMeFN,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse('https://github.com/PiyushKumar-in/'),
                        );
                      },
                      icon: Tooltip(
                        message: "Github",
                        child: FaIcon(
                          FontAwesomeIcons.github,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimary.withAlpha(150),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse(
                            'https://linkedin.com/in/piyush-kumar-027a38286',
                          ),
                        );
                      },
                      icon: Tooltip(
                        message: "LinkedIn",
                        child: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimary.withAlpha(150),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse(
                            'https://leetcode.com/u/Ostrich_flies_in_sky/',
                          ),
                        );
                      },
                      icon: Tooltip(
                        message: "LeetCode",
                        child: FaIcon(
                          FontAwesomeIcons.code,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimary.withAlpha(150),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse(
                            'https://discord.com/users/1305878659491434600',
                          ),
                        );
                      },
                      icon: Tooltip(
                        message: "Discord",
                        child: FaIcon(
                          FontAwesomeIcons.discord,
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimary.withAlpha(150),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 1050) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "03",
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextSpan(
                            text: " Education",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("My Current Academic Qualifications."),
                  ],
                ),
              );
            }

            return Row(
              children: [
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "03",
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        TextSpan(
                          text: " Education",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 1,
                  child: Text("My Current Academic Qualifications."),
                ),
                SizedBox(width: 20),
              ],
            );
          },
        ),
        LayoutBuilder(
          builder: (ctx, consts) {
            if (consts.maxWidth < 1000) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    SizedBox(
                      width: 300,
                      child: MilestoneTimeline(
                        color: Theme.of(context).colorScheme.primary,
                        disabledColor: Theme.of(context).colorScheme.tertiary,
                        milestones: [
                          Milestone(
                            title: Text(
                              "Btech in Mathematics & Computing\n(CGPA: 9.54-ongoing)",
                            ),
                            child: Text(
                              "Indian Institute of Technology, Jammu",
                            ),
                          ),
                          Milestone(
                            title: Text("Class 12th - PCM - 96.4%"),
                            child: Text("Birla Shishu Vihar, Pilani"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(flex: 7),
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    width: 450,
                    child: MilestoneTimeline(
                      color: Theme.of(context).colorScheme.primary,
                      disabledColor: Theme.of(context).colorScheme.tertiary,
                      milestones: [
                        Milestone(
                          title: Text(
                            "Btech in Mathematics & Computing (CGPA: 9.54-ongoing)",
                          ),
                          child: Text("Indian Institute of Technology, Jammu"),
                        ),
                        Milestone(
                          title: Text("Class 12th - PCM - 96.4%"),
                          child: Text("Birla Shishu Vihar, Pilani"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> data = [
      Text(
        "Development",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(softWrap: true, "\t- Cross Platform Development with Flutter."),
      Text(
        softWrap: true,
        "\t- Built a app to control RC car (based on Bluetooth).",
      ),
      Text(softWrap: true, "\t- This website is also built on Flutter."),
      Text(
        softWrap: true,
        "\t- Game Development with Godot Game Engine & GdScript.",
      ),
      SizedBox(height: 20),
      Text(
        softWrap: true,
        "AI/ML",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(
        softWrap: true,
        "\t- Used PyTorch to create a CAPTCHA recognition tool (LSTM/CNN).",
      ),
      Text(
        softWrap: true,
        "\t- Used OpenCV/YoloV8 Model for cartoon size estimation (InterIIT - Tech Meet).",
      ),
      SizedBox(height: 20),
      Text(
        softWrap: true,
        "Robotics",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(softWrap: true, "\t- Worked on Arduino/ESP(s)/RaspberryPi(s)."),
      Text(
        softWrap: true,
        "\t- Worked with Robotic Operating System for InterIIT Tech meet 13.0 (Rank 7th).",
      ),
      Text(
        softWrap: true,
        "\t- Built a Bluetooth controlled RC Car (Won 3rd Prize - Inter-Branch Competition - IIT Jammu).",
      ),
      Text(softWrap: true, "\t- Worked on TinyML, IOT & Edge Computing."),
      SizedBox(height: 20),
      Text(
        softWrap: true,
        "Quantum Computing",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(softWrap: true, "\t- Quantum Computing with Qiskit/IBM cloud."),
      Text(
        softWrap: true,
        "\t- Quantum based AI/ML (Implemented a CNN Model).",
      ),
      SizedBox(height: 20),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 1050) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "02",
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextSpan(
                            text: " Skills",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Things that i've worked with."),
                  ],
                ),
              );
            }

            return Row(
              children: [
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "02",
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        TextSpan(
                          text: " Skills",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 2),
                Flexible(flex: 2, child: Text("Things that i've worked with.")),
                SizedBox(width: 20),
              ],
            );
          },
        ),
        LayoutBuilder(
          builder: (ctx, consts) {
            if (consts.maxWidth < 400) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 30),
                  SizedBox(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data,
                    ),
                  ),
                ],
              );
            }
            if (consts.maxWidth < 800) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 30),
                  SizedBox(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data,
                    ),
                  ),
                ],
              );
            }
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(flex: 7),
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data,
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            );
          },
        ),
      ],
    );
  }
}

class Projects extends StatelessWidget {
  Projects({super.key});

  final List<Project> projectsData = [
    Project(
      image: Image.asset("pdf_con.png"),
      title: "PDF Tools",
      text:
          "Simple PDF Editing/Compressing Merging tools written in Flutter/Dart. PDFTk CLI is used for pdf/image related manipulations & Ghostcript is used for compression.",
      tech: "Flutter/Dart PDFtk GhostScript",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 1050) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "01",
                            style: Theme.of(context).textTheme.displayMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextSpan(
                            text: " Projects",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Here are some of the projects that i've built."),
                  ],
                ),
              );
            }

            return Row(
              children: [
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "01",
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        TextSpan(
                          text: " Projects",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 1,
                  child: Text("Here are some of the projects that i've built."),
                ),
                SizedBox(width: 20),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.end,
            children: projectsData,
          ),
        ),
      ],
    );
  }
}

class Project extends StatelessWidget {
  const Project({
    super.key,
    required this.image,
    required this.text,
    required this.title,
    required this.tech,
  });

  final Image image;
  final String text;
  final String title;
  final String tech;

  @override
  Widget build(BuildContext context) {
    List<Text> tmp = [];

    for (final t in tech.split(" ")) {
      tmp.add(
        Text(
          t,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      );
    }

    return Card(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: image.image,
              width: 600,
              isAntiAlias: true,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(text, textAlign: TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(spacing: 10, children: tmp),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    String intro =
        "Hello, my name is Piyush Kumar, and I am a second-year B.Tech student in Mathematics and Computing at the Indian Institute of Technology, Jammu. I have a keen interest in AI/ML, cross-platform development with Flutter, IoT, Linux and system administration, and the emerging fields of Quantum Computing and Quantum AI.  My academic and project work has allowed me to build a strong foundation in these areas.\n\nDuring my internship with Samsung PRISM, I worked on a \"Synthetic Meme Generation\" project, where I successfully developed a pipeline to generate memes from text or image inputs. The model achieved a 95.12% humor level rating compared to a large dataset.  I am currently exploring the applications of machine learning for edge devices and IoT, aiming to leverage my skills to create efficient and intelligent solutions.";
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1050) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Introduction",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 20),
                Text(intro, textAlign: TextAlign.justify),
              ],
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Flexible(
              flex: 2,
              child: Text(
                "Introduction",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Spacer(),
            Flexible(flex: 5, child: Text(intro, textAlign: TextAlign.justify)),
          ],
        );
      },
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    String about =
        "I am a B.Tech student in Mathematics and Computing at IIT Jammu with a 9.54 CGPA. My technical skills include C++, Python, and Dart, alongside frameworks like Flutter, and PyTorch. My professional experience is highlighted by a Machine Learning Internship with Samsung PRISM, where I developed a successful pipeline for synthetic meme generation.\n\nMy passion for technology is showcased through my projects, such as a full-stack PDF editing tool and a 3D anti-missile warning system. I have co-authored a paper on Quantum CNNs , won a robotics competition , and hold leadership roles as Co-head and Mentor of the IIT Jammu Coding Club. I am keen to apply my diverse experience to solve new challenges in the tech industry.";
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1050) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "04",
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      TextSpan(
                        text: " About",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(about, textAlign: TextAlign.justify),
              ],
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "04",
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    TextSpan(
                      text: " About",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),
            Flexible(flex: 4, child: Text(about, textAlign: TextAlign.justify)),
            SizedBox(width: 20),
          ],
        );
      },
    );
  }
}

class MainScreenBackground extends StatelessWidget {
  const MainScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.2,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.inversePrimary.withAlpha(100),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                "Piyush Kumar",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
