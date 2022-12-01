import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/widgets.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: () => Navigator.pushNamed(context, Routes.project, arguments: {"project": project}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (project.image != "")
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(project.image!), fit: BoxFit.cover)),
                  )
                else
                  AvatarWithName(
                    name: project.name ?? "",
                    shapeSize: 40,
                    fontSize: 16,
                    boxShape: BoxShape.rectangle,
                    count: 1,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    project.name ?? "Unknown",
                    style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.primaryGray1.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
