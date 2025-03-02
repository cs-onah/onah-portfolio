import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/models/project_model.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/utils/header_keys.dart';
import 'package:onah_portfolio/ui/shared/widgets/bouncing_animation.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

List<Project> projectList = [
  Project(
    title: "Cary",
    description: "Cary; A logistics application that allows users negotiate prices with movers,"
        " and track the entire delivery process. Cary currently operates in Cardiff, UK.",
    logoSvg: ImagePath.caryLogo,
    coverImage: ImagePath.caryImage1,
  ),
  Project(
    title: "I-Serv",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
    logoSvg: ImagePath.iservLogo,
    coverImage: ImagePath.iservImage1,
  ),
  Project(
    title: "EvenFare",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
    logoSvg: ImagePath.evenfareLogo,
    coverImage: ImagePath.evenfareImage1,
  ),
  Project(
    title: "L-Scan",
    description: " Passion project - exploring how to integrate Image "
        "Classification AI models into Flutter Apps. This app predicts "
        "certain diseases in cassava plant leaves from an input image",
    logoSvg: ImagePath.lscanLogo,
    coverImage: ImagePath.lscanImage1,
  ),
  Project(
    title: "Tramatch",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
    logoSvg: ImagePath.tramatchLogo,
    coverImage: ImagePath.tramatchImage1,
  ),
  Project(
    title: "FieldMaxPro",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
    logoSvg: ImagePath.fieldmaxLogo,
    coverImage: ImagePath.fieldmaxImage1,
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_isHovered && context.screenType.isDesktop) ...[
              projectActions(),
            ] else ...[
              Text(
                project.description ?? "",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.outlineColor,
                ),
              ),
              const SizedBox(height: 10),
              const SvgRenderWidget(svgPath: SvgPath.allPlatforms),
            ],
            if (context.screenType.isMobile) ...[
              const SizedBox(height: 8),
              projectActions(),
            ]
          ],
        ),
      ),
    );
  }

  Widget projectActions() {
    final size =
        context.screenType.isMobile ? const Size(double.infinity, 48) : null;
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
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
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
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
      ],
    );
  }
}
