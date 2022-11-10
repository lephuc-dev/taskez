import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class WorkspaceView extends StatelessWidget {
  final QueryDocumentSnapshot workspaceDocument;
  final HomeBloc bloc;

  const WorkspaceView({Key? key, required this.workspaceDocument, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: AppColors.primaryGreen,
                ),
                child: Text(
                  workspaceDocument["name"].toString()[0],
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: AppColors.primaryWhite, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  workspaceDocument["name"],
                  style: Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.primaryWhite),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0, childAspectRatio: 5),
              children: [
                workspaceShortcut(context, Icons.person, "Member (${1})", () {}),
                workspaceShortcut(context, Icons.settings, "Setting", () {}),
                workspaceShortcut(context, Icons.book, "Your task", () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: StreamBuilder(
              stream: bloc.getListBoardOfWorkspaceStream(workspaceDocument["id"]),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < snapshot.data!.docs.length) {
                        return boardWidget(context);
                      } else {
                        return workspaceShortcut(context, Icons.add, "New board", () {});
                      }
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget workspaceShortcut(BuildContext context, IconData icon, String content, void Function() onTap) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.primaryGray2,
      ),
      child: InkWellWrapper(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: AppColors.primaryBlack1,
                ),
                const SizedBox(width: 8),
                Text(
                  content,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: AppColors.primaryBlack1,
                        fontSize: 14,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boardWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
              image: NetworkImage(
                "https://images.pexels.com/photos/9754/mountains-clouds-forest-fog.jpg?auto=compress&cs=tinysrgb&w=600",
              ),
              fit: BoxFit.cover)),
      child: InkWellWrapper(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Stack(
            children: [
              Container(color: AppColors.primaryBlack1.withOpacity(0.4)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Object-oriented programming",
                  style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColors.primaryWhite, fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}
