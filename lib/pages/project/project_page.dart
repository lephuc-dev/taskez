import 'package:flutter/material.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/widgets/common_app_bar.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';

class ProjectPage extends StatefulWidget {
  final ProjectBloc bloc;

  const ProjectPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends BaseState<ProjectPage, ProjectBloc> {
  @override
  Widget build(BuildContext context) {
    final project = (ModalRoute.of(context)!.settings.arguments as Map)["project"] as Project;
    return Scaffold(
      appBar: commonAppBar(context, title: project.name),
    );
  }

  @override
  ProjectBloc get bloc => widget.bloc;
}
