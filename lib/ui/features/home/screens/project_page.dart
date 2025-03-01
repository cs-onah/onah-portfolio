import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/models/project_model.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

List<Project> projectList = [
  Project(
    title: "Cary",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
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
  ),
  Project(
    title: "L-Scan",
    description: "Design mobile-first, responsive apps that focus on delivering"
        " a smooth, intuitive experience across multiple devices.",
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

const projectListWidgetHeight = 550.0;

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutConstraint(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const SvgRenderWidget(svgPath: SvgPath.projectHeader),
          const SizedBox(height: 29),

          if (context.screenType.isMobile)
            ...[
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projectList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                itemBuilder: (context, index) {
                  final project = projectList[index];
                  return ProjectCard(project: project);
                },
              ),
            ]
          else ...[
            SizedBox(
              height: projectListWidgetHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: projectList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 54),
                itemBuilder: (context, index) {
                  final project = projectList[index];
                  return ProjectCard(project: project);
                },
              ),
            ),
          ],

          /// Project Carousel
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: projectListWidgetHeight,
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
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            project.description ?? "",
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.outlineColor,
            ),
          ),
          const SizedBox(height: 10),
          const SvgRenderWidget(svgPath: SvgPath.allPlatforms),
        ],
      ),
    );
  }
}
