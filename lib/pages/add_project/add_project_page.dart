import 'package:flutter/material.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../enums/enums.dart';
import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class AddProjectPage extends StatefulWidget {
  final AddProjectBloc bloc;

  const AddProjectPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends BaseState<AddProjectPage, AddProjectBloc> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  @override
  void dispose() {
    nameTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add your project",
              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Sign in to continue",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: AppColors.primaryGray1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                "Project Name",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
              ),
            ),
            CommonTextField(
              textEditingController: nameTextController,
              hintText: "Enter project name",
              textInputType: TextInputType.emailAddress,
              validatorStyle: ValidatorStyle.text,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                "Description",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 20),
              ),
            ),
            CommonTextField(
              textEditingController: nameTextController,
              hintText: "Enter project description",
              textInputType: TextInputType.emailAddress,
              validatorStyle: ValidatorStyle.text,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: AppColors.primaryWhite,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.primaryBlack1),
    );
  }

  @override
  AddProjectBloc get bloc => widget.bloc;
}
