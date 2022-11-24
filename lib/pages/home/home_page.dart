import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../router/router.dart';
import 'widgets/slider_menu_view.dart';
import 'widgets/projects_tab.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  static const List<Tab> _tabs = [
    Tab(text: "Project"),
    Tab(text: "My Task"),
    Tab(text: "Schedule"),
  ];

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        drawer: SliderMenuView(bloc),
        appBar: AppBar(
          title: Text(
            "Taskez",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: AppColors.primaryBlack1, fontSize: 20),
          ),
          centerTitle: false,
          backgroundColor: AppColors.primaryWhite,
          elevation: 0.5,
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
                  position: BadgePosition.topEnd(end: -8),
                  shape: BadgeShape.circle,
                  badgeColor: AppColors.primaryRed,
                  badgeContent: const Text(
                    '3',
                    style:
                        TextStyle(color: AppColors.primaryWhite, fontSize: 12),
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
          bottom: TabBar(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            labelStyle: Theme.of(context).textTheme.subtitle1,
            labelColor: AppColors.primaryBlack1,
            indicatorColor: AppColors.yellow,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: [
            ProjectsTab(bloc: widget.bloc),
            const Center(child: Text('Content of Tab Two')),
            const Center(child: Text('Content of Tab Three')),
          ],
        ),
      ),
    );
  }

  @override
  HomeBloc get bloc => widget.bloc;
}
