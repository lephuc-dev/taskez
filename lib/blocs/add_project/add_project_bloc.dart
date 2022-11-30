import '../../base/base.dart';
import '../../repositories/repositories.dart';
import 'add_project.dart';

class AddProjectBloc extends BaseBloc<AddProjectState> {
  final ProjectRepository projectRepository;

  AddProjectBloc(this.projectRepository);

  @override
  void dispose() {
    super.dispose();
  }
}
