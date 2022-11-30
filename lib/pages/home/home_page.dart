import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../router/router.dart';
import '../../widgets/widgets.dart';
import 'widgets/favorite_project_item.dart';
import 'widgets/project_item.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Taskez",
            style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.primaryBlack1, fontSize: 20),
          ),
          centerTitle: false,
          backgroundColor: AppColors.primaryWhite,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.primaryBlack1),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                color: AppColors.primaryBlack1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.notification),
                child: Badge(
                  position: BadgePosition.topEnd(top: 6, end: -8),
                  shape: BadgeShape.circle,
                  badgeColor: AppColors.primaryRed,
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: AppColors.primaryWhite, fontSize: 12),
                  ),
                  animationType: BadgeAnimationType.slide,
                  child: const Icon(
                    Icons.notifications,
                    color: AppColors.primaryBlack1,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            StreamBuilder<List<ProjectParticipant>>(
              stream: widget.bloc.getListFavoriteProjectByMyIdStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: AppColors.primaryGray1.withOpacity(0.3),
                        width: MediaQuery.of(context).size.width,
                        child: const Text("Favorite Project"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 2.0,
                          ),
                          itemBuilder: (BuildContext context, int i) {
                            return StreamBuilder<Project>(
                                stream: widget.bloc.getProjectStream(snapshot.data![i].projectId ?? ""),
                                builder: (context, projectSnapshot) {
                                  if (projectSnapshot.hasData) {
                                    return FavoriteProjectItem(project: projectSnapshot.data!);
                                  } else {
                                    return Container();
                                  }
                                });
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            StreamBuilder<List<ProjectParticipant>>(
              stream: widget.bloc.getListProjectByMyIdStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: AppColors.primaryGray1.withOpacity(0.3),
                        width: MediaQuery.of(context).size.width,
                        child: const Text("Project"),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          return StreamBuilder<Project>(
                              stream: widget.bloc.getProjectStream(snapshot.data![i].projectId ?? ""),
                              builder: (context, projectSnapshot) {
                                if (projectSnapshot.hasData) {
                                  return ProjectItem(project: projectSnapshot.data!);
                                } else {
                                  return Container();
                                }
                              });
                        },
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
