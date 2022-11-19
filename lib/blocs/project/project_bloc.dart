import '../../base/base.dart';
import '../blocs.dart';
import '../../repositories/repositories.dart';

class ProjectBloc extends BaseBloc<ProjectState> {
  final ProjectRepository projectRepository;

  ProjectBloc(this.projectRepository);
}
