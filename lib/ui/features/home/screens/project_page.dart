import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/models/project_model.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/utils/header_keys.dart';
import 'package:onah_portfolio/ui/shared/widgets/bouncing_animation.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/spaced_row.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:url_launcher/url_launcher.dart';

List<Project> projectList = [
  Project(
    title: "Cary",
    description:
        "A logistics application that allows users negotiate prices with movers,"
        " and track the entire delivery process. Cary currently operates in Cardiff, UK.",
    logoSvg: ImagePath.caryLogo,
    coverImage: ImagePath.caryImage1,
    iosLink: "https://apps.apple.com/us/app/cary-mobile/id6738658124",
  ),
  Project(
    title: "I-Serv",
    description: "A structured marketplace that connects users with verified "
        "and trusted local professionals for all your service needs. I-Serv is operational in Lagos, Nigeria",
    logoSvg: ImagePath.iservLogo,
    coverImage: ImagePath.iservImage1,
    androidLink: "https://play.google.com/store/apps/details?id=com.iservehbg.iserve_flutter&hl=en",
    iosLink: "https://apps.apple.com/us/app/i-serv-mobile/id6714478584",
  ),
  Project(
    title: "EvenFare",
    description: "Eco-friendly courier service dedicated to reducing carbon "
        "footprint while delivering your packages efficiently. EvenFare is set to launch in Lagos, Nigeria",
    logoSvg: ImagePath.evenfareLogo,
    coverImage: ImagePath.evenfareImage1,
  ),
  Project(
    title: "L-Scan",
    description: "Passion project - exploring how to integrate Image "
        "Classification AI models into Flutter Apps. This app predicts "
        "certain diseases in cassava plant leaves from an input image",
    logoSvg: ImagePath.lscanLogo,
    coverImage: ImagePath.lscanImage1,
    githubLink: "https://github.com/cs-onah/cassava_disease_detection",
  ),
  Project(
    title: "Tramatch",
    description: "A premier traditional marriage matchmaking service catering "
        "to individuals seeking a partner based on shared traditional values and "
        "faith-based beliefs.",
    logoSvg: ImagePath.tramatchLogo,
    coverImage: ImagePath.tramatchImage1,
    androidLink: "https://play.google.com/store/apps/details?id=com.tramatch.tramatch&hl=en",
    iosLink: "https://apps.apple.com/us/app/tramatch-dating-marriage/id6503286662",
  ),
  Project(
    title: "FieldMaxPro iOS",
    description:
        "FieldMaxPro is an enterprise fieldforce management system designed for Sales/Marketing Managers. The app allows managers track activities of their field representatives.",
    logoSvg: ImagePath.fieldmaxLogo,
    coverImage: ImagePath.fieldmaxImage1,
    iosLink: "https://apps.apple.com/us/app/fieldmaxpro-retail/id6468567589",
  ),
];

const projectListWidgetHeight = 580.0;

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});
  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final controller = ScrollController();

  double rightScrollLimit = 0;
  double leftScrollLimit = 50;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rightScrollLimit = controller.position.maxScrollExtent - 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = context.screenType.isMobile
        ? const EdgeInsets.symmetric(horizontal: 32)
        : const EdgeInsets.symmetric(horizontal: 80);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: padding,
          child: SvgRenderWidget(
            svgPath: SvgPath.projectHeader,
            key: HeaderKey.projectPage,
          ),
        ),
        const SizedBox(height: 29),

        if (context.screenType.isMobile) ...[
          ListView.separated(
            padding: padding,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projectList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 40),
            itemBuilder: (context, index) {
              final project = projectList[index];
              return Center(child: ProjectCard(project: project));
            },
          ),
        ] else ...[
          Stack(
            children: [
              SizedBox(
                height: projectListWidgetHeight,
                child: ListView.separated(
                  padding: padding,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: projectList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 54),
                  itemBuilder: (context, index) {
                    final project = projectList[index];
                    return ProjectCard(project: project);
                  },
                ),
              ),

              /// Right arrow
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: ListenableBuilder(
                    listenable: controller,
                    builder: (context, value) {
                      if (controller.position.pixels > rightScrollLimit) {
                        return const SizedBox.shrink();
                      }
                      return arrowButton(
                        context,
                        icon: Icons.arrow_forward,
                        onTap: () => controller.animateTo(
                          controller.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        ),
                      );
                    }),
              ),

              /// Left arrow
              Positioned(
                top: 0,
                bottom: 0,
                left: 40,
                child: ListenableBuilder(
                    listenable: controller,
                    builder: (context, value) {
                      if (controller.position.pixels < leftScrollLimit) {
                        return const SizedBox.shrink();
                      }
                      return arrowButton(
                        context,
                        icon: Icons.arrow_back,
                        onTap: () => controller.animateTo(
                          controller.position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        ),
                      );
                    }),
              )
            ],
          ),
        ],

        /// Project Carousel
        const SizedBox(height: 10),
      ],
    );
  }

  Widget arrowButton(
    BuildContext context, {
    VoidCallback? onTap,
    IconData? icon,
  }) {
    return BounceAnimation(
      child: Container(
        margin: const EdgeInsets.only(right: 40, bottom: 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.black,
        ),
        child: IconButton(
          onPressed: onTap,
          iconSize: 40,
          icon: Icon(icon, color: context.colors.white),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Project get project => widget.project;

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SizedBox(
        height: context.screenType.isDesktop ? projectListWidgetHeight : null,
        width: 390,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: project.coverImage == null
                    ? null
                    : DecorationImage(
                        image: AssetImage(project.coverImage!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                if (project.logoSvg != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ImageRenderWidget.asset(imagePath: project.logoSvg!),
                  ),
                Expanded(
                  child: Text(
                    project.title ?? '',
                    style: context.textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_isHovered && context.screenType.isDesktop) ...[
              /// Show supported platforms
              supportedPlatforms(),
              const SizedBox(height: 15),
              projectActions(),
            ] else ...[
              Text(
                project.description ?? "",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.outlineColor,
                ),
              ),
              const SizedBox(height: 10),
              /// Show supported platforms
              supportedPlatforms(),
            ],

            /// Action buttons
            if (context.screenType.isMobile) ...[
              const SizedBox(height: 8),
              projectActions(),
            ]
          ],
        ),
      ),
    );
  }

  Widget supportedPlatforms() {
    return Builder(builder: (context) {
      if (project.githubLink != null) {
        return const SvgRenderWidget(svgPath: SvgPath.allPlatformsGithub);
      }
      if (project.androidLink != null && project.iosLink != null) {
        return const SvgRenderWidget(svgPath: SvgPath.allPlatforms);
      }
      if (project.androidLink != null) {
        return const SvgRenderWidget(
          svgPath: SvgPath.allPlatformsWithoutApple,
        );
      }
      if (project.iosLink != null) {
        return const SvgRenderWidget(
          svgPath: SvgPath.allPlatformsWithoutAndroid,
        );
      }
      return const SvgRenderWidget(svgPath: SvgPath.allPlatforms);
    });
  }

  Widget projectActions() {
    final size =
        context.screenType.isMobile ? const Size(double.infinity, 48) : null;
    return SpacedRow(
      spacing: 10,
      children: [
        if (project.iosLink != null)
          Expanded(
            child: ElevatedButton(
              onPressed: () => launchUrl(Uri.parse(project.iosLink!)),
              style: ElevatedButton.styleFrom(minimumSize: size),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgRenderWidget(svgPath: SvgPath.apple),
                  SizedBox(width: 10),
                  Text("App Store"),
                ],
              ),
            ),
          ),
        if (project.androidLink != null)
          Expanded(
            child: ElevatedButton(
              onPressed: () => launchUrl(Uri.parse(project.androidLink!)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: context.colors.white),
                minimumSize: size,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SvgRenderWidget(svgPath: SvgPath.playstore),
                  const SizedBox(width: 10),
                  Text(
                    "PlayStore",
                    style: TextStyle(color: context.colors.white),
                  ),
                ],
              ),
            ),
          ),
        if (project.githubLink != null)
          Expanded(
            child: ElevatedButton(
              onPressed: () => launchUrl(Uri.parse(project.githubLink!)),
              style: ElevatedButton.styleFrom(minimumSize: size),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgRenderWidget(svgPath: SvgPath.apple),
                  SizedBox(width: 10),
                  Text("GitHub"),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
