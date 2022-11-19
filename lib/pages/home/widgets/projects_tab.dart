import 'package:flutter/material.dart';
import 'package:taskez/models/models.dart';
import '../../../resources/resources.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';

class ProjectsTab extends StatefulWidget {
  final HomeBloc bloc;

  const ProjectsTab({Key? key, required this.bloc}) : super(key: key);

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ProjectParticipant>>(
        stream: widget.bloc.getListProjectByMyIdStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int i) {
                return StreamBuilder<Project>(
                    stream: widget.bloc.getProjectStream(snapshot.data![i].projectId ?? ""),
                    builder: (context, projectSnapshot) {
                      if (projectSnapshot.hasData) {
                        return projectItem(project: projectSnapshot.data!);
                      } else {
                        return Container();
                      }
                    });
              },
            );
          } else {
            return const CircularProgressIndicator(color: Colors.amber);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellow,
        child: Icon(
          Icons.add,
          color: AppColors.primaryBlack1.withOpacity(0.7),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget projectItem({required Project project}) {
    return InkWellWrapper(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (project.image != "")
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(project.image!), fit: BoxFit.cover)),
                  )
                else
                  AvatarWithName(
                    name: project.name ?? "",
                    shapeSize: 65,
                    fontSize: 16,
                    boxShape: BoxShape.rectangle,
                    count: 1,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.name ?? "Unknown",
                        style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "My tasks (0)",
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "Member (1)",
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
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
