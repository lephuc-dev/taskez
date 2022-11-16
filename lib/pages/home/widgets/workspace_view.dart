import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../extensions/extensions.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../widgets/widgets.dart';

class WorkspaceView extends StatefulWidget {
  final QueryDocumentSnapshot workspaceDocument;
  final HomeBloc bloc;

  const WorkspaceView({Key? key, required this.workspaceDocument, required this.bloc}) : super(key: key);

  @override
  State<WorkspaceView> createState() => _WorkspaceViewState();
}

class _WorkspaceViewState extends State<WorkspaceView> {
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
                  color: AppColors.yellow,
                ),
                child: Text(
                  widget.workspaceDocument["name"].toString()[0],
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: AppColors.primaryWhite, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.workspaceDocument["name"],
                  style: Theme.of(context).textTheme.headline4,
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
                workspaceShortcut(Icons.person, "Members (${1})", () {}),
                workspaceShortcut(Icons.book, "My tasks", () {}),
                workspaceShortcut(Icons.settings, "Setting", () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: StreamBuilder(
              stream: widget.bloc.getListBoardOfWorkspaceStream(widget.workspaceDocument["id"]),
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
                        return boardWidget(
                          snapshot.data!.docs[index]["name"],
                          snapshot.data!.docs[index]["background"],
                        );
                      } else {
                        return workspaceShortcut(Icons.add, "New board", () {});
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

  Widget workspaceShortcut(IconData icon, String content, void Function() onTap) {
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

  Widget boardWidget(String name, String background) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        image: background.length > 7
            ? DecorationImage(
                image: NetworkImage(background),
                fit: BoxFit.cover,
              )
            : null,
        color: background.length == 7 ? background.toColor() : null,
      ),
      child: InkWellWrapper(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Stack(
            children: [
              Container(color: AppColors.primaryBlack1.withOpacity(0.4)),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColors.primaryWhite, fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}